unit uObserver.Interfaces;

interface

type
  ISubscriber = interface
    ['{A1B2C3D4-E5F6-7890-1234-567890ABCDEF}']
    procedure Update(const AMessage: string);
  end;

  IPublisher = interface
    ['{09876543-2109-8765-4321-FEDCBA098765}']
    procedure Subscribe(ASubscriber: ISubscriber);
    procedure Unsubscribe(ASubscriber: ISubscriber);
    procedure Notify(const AMessage: string);
  end;

implementation

end.

