use v6.c;

use GTK::Application;
use GTK::Box;
use GTK::Label;
use GTK::Switch;
use Handy::Keypad;

my $a = GTK::Application.new( title => 'org.genex.handy.keypad' );

$a.activate.tap( -> *@a {
  my  $b        = GTK::Box.new-vbox(10);
  my ($sb, $lb) = GTK::Box.new-hbox(8) xx 2;
  my ($sl, $ll) = GTK::Label.new('Show Symbols', 'Show Letters');
  my ($ss, $ls) = GTK::Switch.new xx 2;
  my  $e        = GTK::Entry.new;
  my  $k        = Handy::Keypad.new(False, False);

  $sb.pack_start($_) for $sl, $ss;
  $lb.pack_start($_) for $ll, $ls;
   $b.pack_start($_) for $sb, $lb, $e, $k;

  $ss.notify('active').tap( -> *@a {
    say "SS Active: { $ss.active }";
    $k.symbols-visible = $ss.active;
  });

  $ls.notify('active').tap( -> *@a {
    say "LS Active: { $ls.active }";
    $k.letters-visible = $ls.active;
  });

  $a.window.destroy-signal.tap( -> *@a {
    say "Keypad entry: { $e.text }";
    $a.quit;
  });

  $k.entry = $e;
  $a.window.add($b);
  $a.window.show-all;
});

$a.run;
