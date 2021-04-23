import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class Audio {
  String name;
  String audioFile;

  AudioPlayer player;
  AudioCache cache;
  double volume = 1.0;

  Audio(this.name, this.audioFile) {
    player = AudioPlayer();
    cache = AudioCache(fixedPlayer: player);
  }

  void load() async {
    await cache.load(audioFile);
    print('loaded $audioFile');
  }

  void play() async {
    player = await cache.loop(audioFile, volume: volume);
    print("playing $audioFile");
  }

  void mute() {
    player.setVolume(0.0);
    print("muted $audioFile");
  }

  void unmute() {
    player.setVolume(1.0);
    print("unmuted $audioFile");
  }

  void stop() {
    player?.stop();
  }
}

List<Audio> getAudio() {
  List<Audio> _audioList = <Audio>[
    Audio('Blaster', 'Blaster.wav'),
    Audio('Borr', 'Borr.wav'),
    Audio('Flourlack', 'Flourlack.wav'),
    Audio('Puts', 'Puts.wav'),
    Audio('Rontgen', 'Rontgen.wav'),
    Audio('Sickel', 'Sickel.wav'),
    Audio('Sond', 'Sond.wav'),
    Audio('Sug', 'Sug.wav'),
    Audio('Vatten', 'Vatten.wav'),
  ];
  return _audioList;
}

void loadAudio(List<Audio> audioList) {
  for (Audio audio in audioList) {
    audio.load();
  }
}

void playAudio(List<Audio> audioList) {
  for (Audio audio in audioList) {
    audio.play();
  }
}

void stopAudio(List<Audio> audioList) {
  for (Audio audio in audioList) {
    audio.stop();
  }
}

void unmuteAudio(List<Audio> audioList) {
  for (Audio audio in audioList) {
    audio.unmute();
  }
}
