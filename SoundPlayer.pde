/* This source code is copyrighted materials owned by the UT system and cannot be placed 
into any public site or public GitHub repository. Placing this material, or any material 
derived from it, in a publically accessible site or repository is facilitating cheating 
and subjects the student to penalities as defined by the UT code of ethics. */

import ddf.minim.*; // Import Sound Library

class SoundPlayer 
{
  Minim minimplay;
  AudioSample boomPlayer, popPlayer, gameOverPlayer;
  AudioSample explosionBossAsteroid, explosionLargeAsteroid, explosionShip, explosionSmallAsteroid;
  AudioSample ohYea, missileLaunch;
  SoundPlayer(Object app) 
  {
    minimplay = new Minim(app); 
    
    boomPlayer = minimplay.loadSample("explode.wav", 1024); 
    gameOverPlayer = minimplay.loadSample("gameovr.wav", 1024); 
    popPlayer = minimplay.loadSample("pop.wav", 1024);
    explosionBossAsteroid = minimplay.loadSample("BossAsteroidDestroyed.wav", 1024);
    explosionLargeAsteroid = minimplay.loadSample("LargAsteroidExplosion.wav", 1024);
    explosionSmallAsteroid = minimplay.loadSample("SmallAsteroidExplosion.wav", 1024);
    explosionShip = minimplay.loadSample("ExplosionShip.wav", 1024);
    ohYea = minimplay.loadSample("win.wav", 1024);
    missileLaunch = minimplay.loadSample("MissileLaunch.wav", 1024);
  }

  void playExplosion() 
  {
    boomPlayer.trigger();
  }

  void playPop() 
  {
    popPlayer.trigger();
  }

  void playGameOver() 
  {
    gameOverPlayer.trigger();
  }
  
  void playExplosionBossAsteroid() 
  {
    explosionBossAsteroid.trigger();
  }
  
  void playExplosionLargeAsteroid() 
  {
    explosionLargeAsteroid.trigger();
  }

  void playExplosionSmallAsteroid() 
  {
    explosionSmallAsteroid.trigger();
  }
  
  void playExplosionShip() 
  {
    explosionShip.trigger();
  }

  void playOhYea() 
  {
    ohYea.trigger();
  }

  void playMissileLaunch() 
  {
    missileLaunch.trigger();
  }
}
