package Sympatic::oo;
use Sympatic;
use Moo;

fun import ($to=caller) {
    Sympatic->import::into($to);
    Moo->import::into($to);
}


1;


