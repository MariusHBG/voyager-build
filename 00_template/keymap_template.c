uint16_t get_quick_tap_term(uint16_t keycode, keyrecord_t *record){

    switch (keycode) {
        case LT(1, KC_T):
        case LT(2, KC_S):
        case LT(3, KC_R):
        case LT(4, KC_N):
            return 0;
        default:
            return TAPPING_TERM;
    }
}