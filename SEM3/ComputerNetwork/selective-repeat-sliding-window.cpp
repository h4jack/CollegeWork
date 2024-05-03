#include <iostream>
#include <cstdlib>
#include <string>
#include <queue>
#include <ctime>

using namespace std;

class frame
{
  public:
    string data;
    int seq;
};

class Simulator
{
    queue<frame> channel;
    queue<int> faultyFramesIndex;
    frame *frames;
    queue<int> acks;
    int totalFrames;
    int windowSize;
    int i;
    bool isNoisy;

  public:
    Simulator();
    ~Simulator();
    void sender(int);
    void reciever();
    void recieveACK();
    void simulate(bool isNoisy = false);
    void sendFrame(int frameIndex);
};

int main()
{
    Simulator sim;
    int choice;
    while (true)
    {
        cout << "SELECTIVE REPEAT SIMULATOR" << endl;
        cout << "1) Simulate selective repeat for noisy channel" << endl;
        cout << "2) Simulate selective repeat for non-noisy channel" << endl;
        cout << "Enter 0 to exit..." << endl;
        cout << "Enter your choice: ";
        cin >> choice;
        switch (choice)
        {
        case 0:
            exit(1);
        case 1:
            sim.simulate(true);
            break;
        case 2:
            sim.simulate(false);
            break;
        default:
            cout << "Wrong choice please try again..." << endl;
        }
        cout << "Press enter to continue...";
        cin.ignore();
        cin.get();
    }
}

Simulator::Simulator()
{
    srand(time(0));
    cout << "Enter total number of frames to simulate: ";
    cin >> totalFrames;
    cout << "Enter window size: ";
    cin >> windowSize;
    frames = new frame[totalFrames];
    for (int i = 0; i < totalFrames; i++)
    {
        cout << "Enter frame number " << i << " : ";
        cin >> frames[i].data;
        frames[i].seq = i % windowSize;
    }
    isNoisy = false;
}

Simulator::~Simulator()
{
    if (frames != NULL)
        delete[] frames;
}

void Simulator::sender(int from)
{
    int fault = rand() % 2;
    for (int i = from; i < from + windowSize && i < totalFrames; i++)
    {
        sendFrame(i);
    }
}

void Simulator::reciever()
{
    if(!channel.empty()){
        cout << "RECEIVED:\n";
    }
    while (!channel.empty())
    {
        cout << "    Recieved Frame: " << channel.front().data << " SEQ: " << channel.front().seq << "; sending ACK" << endl;
        channel.pop();
    }
}

void Simulator::recieveACK()
{
    cout << "SENDER:\n";
    while (!acks.empty())
    {
        cout << "    Recived ACK for seq: " << acks.front() << endl;
        acks.pop();
        i++;
    }
    while (!faultyFramesIndex.empty())
    {
        cout << "    Haven't recieved ACK for frame SEQ: " << faultyFramesIndex.front() % windowSize
             << "; Resending frame" << endl;
        sendFrame(faultyFramesIndex.front());
        faultyFramesIndex.pop();
        reciever();
        recieveACK();
    }
}

void Simulator::simulate(bool isNoisy)
{
    this->isNoisy = isNoisy;
    for (i = 0; i < totalFrames;)
    {
        sender(i);
        reciever();
        recieveACK();
    }
}

void Simulator::sendFrame(int frameIndex)
{
    int faulty;
    if (rand() % 2 == 0 && isNoisy)
        faulty = 1;
    else
        faulty = 0;
    cout << "SENDER:\n  sent frame " << frames[i].data << " SEQ: " << frames[i].seq << endl;
    if (!faulty)
    {
        channel.push(frames[i]);
        acks.push(frames[i].seq);
    }
    else
    {
        faultyFramesIndex.push(frameIndex);
    }
}