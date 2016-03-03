//
// This layout is based on the following needs:
// ...
//

#include "planck.h"

#define _QWERTY 0
#define _HIGH 1
#define _LOW 2
#define _FN 3
#define _EXTRA 4
#define _LCTL 5
#define _MOUSE 6
#define ________ KC_NO // just for easy reading

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

    [_QWERTY] = { /* Qwerty */
        {LT(_MOUSE, KC_ESC), KC_Q, KC_W,   KC_E,     KC_R,     KC_T,     KC_Y,     KC_U,     KC_I,     KC_O,     KC_P,  KC_BSPC},
        {LT(_FN, KC_TAB), KC_A,  KC_S,     KC_D,     KC_F,     KC_G,     KC_H,     KC_J,     KC_K,     KC_L,  KC_SCLN,  KC_QUOT},
        { KC_LSFT,     KC_Z,     KC_X,     KC_C,     KC_V,     KC_B,     KC_N,     KC_M,  KC_COMM,   KC_DOT,  KC_SLSH, SFT_T(KC_ENT)},
        { KC_LCTL, ________,  KC_LGUI,  KC_LALT,  KC_LCTL,   KC_SPC,LT(_HIGH, KC_SPC),
                                                                               MO(_LOW),  KC_RALT,  KC_RGUI, ________, KC_RCTL}
    },

    [_HIGH] = {
        {  KC_GRV, ________, ________, ________, ________, ________, ________, ________,  KC_LCBR,  KC_RCBR,   KC_DEL,  KC_BSPC},
        {    KC_1,     KC_2,     KC_3,     KC_4,     KC_5,     KC_6,     KC_7,     KC_8,     KC_9,     KC_0,  KC_MINS,   KC_EQL},
        { KC_LSFT, ________, ________, ________, ________, ________, ________, ________,  KC_COMM,   KC_DOT,  KC_BSLS,  KC_LSFT},
        { KC_LCTL, ________,  KC_LGUI,  KC_LALT,  KC_LCTL,  KC_RALT,  KC_TRNS, ________,  KC_RALT,  KC_RGUI, ________,  KC_RCTL}
    },

    [_FN] = {
        {  KC_INS, ________, ________,   KC_END, ________, ________, ________,  KC_PGUP,    KC_UP,  KC_PGDN,   KC_DEL, LCTL(KC_BSLS)},
        { KC_TRNS,  KC_HOME, ________, LCTL(KC_D), LCTL(KC_F), KC_ESC, KC_HOME, KC_LEFT,  KC_DOWN,  KC_RGHT, ________,  KC_ENT},
        {________, ________, ________, ________, ________, ________, ________, ________, ________, ________, ________, KC_RSFT},
        {   RESET, ________,  KC_LGUI,  KC_LALT,  KC_LCTL, KC_SPC,     KC_SPC, ________, ________, ________, ________, KC_LCTL}
    },

    [_LOW] = {
        {   KC_F1,    KC_F2,    KC_F3,    KC_F4,    KC_F5,    KC_F6,    KC_F7,    KC_F8,    KC_F9,   KC_F10,   KC_F11,   KC_F12},
        { KC_EXLM,    KC_AT,  KC_HASH,   KC_DLR,  KC_PERC,  KC_CIRC,  KC_AMPR,  KC_ASTR,  KC_LPRN,  KC_RPRN,  KC_UNDS,  KC_PLUS},
        {LGUI(KC_1), LGUI(KC_2), LGUI(KC_3), LGUI(KC_4), LGUI(KC_5), LGUI(KC_F12), ________, ________, ________, ________, ________, ________},
        {________, ________, ________, ________, ________, ________, ________,  KC_TRNS, ________, ________, ________, ________}
    },
    /*
    [_EXTRA] = {
        {________, ________, ________, ________, ________, ________, ________, ________, ________, ________, ________, ________},
        {________, ________, ________, ________, ________, ________, ________, ________, ________, ________, ________, ________},
        {________, ________, ________, ________, ________, ________, ________, ________, ________, ________, ________, ________},
        {________, ________, ________, ________, ________,  KC_TRNS, ________, ________, ________, ________, ________, ________}
    },
    */
    [_MOUSE] = {
        { KC_TRNS, ________, ________,  KC_ACL0, ________, ________, ________,  KC_WH_U,  KC_MS_U,  KC_WH_D, ________, ________},
        {________, ________, ________,  KC_ACL1, ________, ________, ________,  KC_MS_L,  KC_MS_D,  KC_MS_R, ________, ________},
        {________, ________, ________, ________, ________, ________, ________, ________, ________, ________, ________, ________},
        {________, ________, ________,  KC_ACL2,  KC_ACL1,  KC_ACL0, KC_MS_BTN1, KC_MS_BTN3, KC_MS_BTN2, ________, ________, ________}
    }
};

const uint16_t PROGMEM fn_actions[] = {
    [_LCTL] = ACTION_MODS_TAP_KEY(KC_LCTL, M(12)),    // does not work
};
