import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class Audio {
  String name;
  String audioFile;

  AudioPlayer player;
  AudioCache cache;
  double volume = 0.0;

  Audio(this.name, this.audioFile) {
    player = AudioPlayer();
    cache = AudioCache(fixedPlayer: player);
  }

  void load() async {
    await cache.load(audioFile);
  }

  void play() async {
    player = await cache.loop(audioFile, volume: volume);
  }

  void mute() {
    player.setVolume(0.0);
    print("muted $audioFile");
  }

  void unmute() {
    player.setVolume(1.0);
    print("unmuted $audioFile");
  }

  void stop() async {
    await player.stop();
    print("stopped $audioFile");
    await player.release();
    print("released $audioFile");
    cache.clearCache();
    print("cleard cache");
  }
} //class Audio

List<Audio> getAudioList() {
  List<Audio> _audioList = <Audio>[
    Audio('Blaster', 'Audio/Blaster.wav'),
    Audio('Borr', 'Audio/Borr.wav'),
    Audio('Flourlack', 'Audio/Flourlack.wav'),
    Audio('Puts', 'Audio/Puts.wav'),
    Audio('Rontgen', 'Audio/Rontgen.wav'),
    Audio('Sickel', 'Audio/Sickel.wav'),
    Audio('Sond', 'Audio/Sond.wav'),
    Audio('Stol', 'Audio/Stol.wav'),
    Audio('Sug', 'Audio/Sug.wav'),
    Audio('Vatten', 'Audio/Vatten.wav'),
  ];
  return _audioList;
}

void loadAudio(List<Audio> audioList) {
  for (Audio audio in audioList) {
    audio.load();
    print('loaded all audio');
  }
}

void playAudio(List<Audio> audioList) {
  for (Audio audio in audioList) {
    audio.play();
    print('plays all audio');
  }
}

void stopAudio(List<Audio> audioList) {
  for (Audio audio in audioList) {
    audio.stop();
    print('stopped & released all audio');
  }
}

Audio getAudio(String name, List<Audio> audioList) {
  Audio _audio;
  for (var i = 0; i < audioList.length; i++) {
    if (audioList[i].name == name) {
      _audio = audioList[i];
    }
  }
  return _audio;
}
