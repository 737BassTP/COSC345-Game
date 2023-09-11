/**
* @file input.c
* @brief Implements input.h
*/

#include "everything.h"

//Global variables.
int glob_vk_right   = 0;///< key: right
int glob_vk_left    = 0;///< key: left
int glob_vk_up 	    = 0;///< key: up
int glob_vk_down    = 0;///< key: down
int glob_vk_space   = 0;///< key: space
int glob_vk_enter   = 0;///< key: enter
int glob_vk_tab     = 0;///< key: tab
int glob_vk_pagedown= 0;///< key: page down
int glob_vk_pageup  = 0;///< key: page up
int glob_vk_home    = 0;///< key: home
int glob_vk_end     = 0;///< key: end
int glob_vk_insert  = 0;///< key: insert
int glob_vk_delete  = 0;///< key: delete
int glob_vk_f1      = 0;///< key: F2
int glob_vk_f2      = 0;///< key: F2
int glob_vk_f3      = 0;///< key: F3
int glob_vk_f4      = 0;///< key: F4
int glob_vk_f5      = 0;///< key: F5
int glob_vk_f6      = 0;///< key: F6
int glob_vk_f7      = 0;///< key: F7
int glob_vk_f8      = 0;///< key: F8
int glob_vk_f9      = 0;///< key: F9
int glob_vk_f10     = 0;///< key: F10
int glob_vk_f11     = 0;///< key: F11
int glob_vk_f12     = 0;///< key: F12
int glob_vk_0       = 0;///< key: 0
int glob_vk_1       = 0;///< key: 1
int glob_vk_2       = 0;///< key: 2
int glob_vk_3       = 0;///< key: 3
int glob_vk_4       = 0;///< key: 4
int glob_vk_5       = 0;///< key: 5
int glob_vk_6       = 0;///< key: 6
int glob_vk_7       = 0;///< key: 7
int glob_vk_8       = 0;///< key: 8
int glob_vk_9       = 0;///< key: 9
//int glob_vk_ = 0;///< key: 
//int glob_vk_ = 0;///< key: 

int keyboard_set_new(int *keyid,int keyval)
{
	/**
	* @brief Actively update a keyboard variable.
	* @param keyid pointer to a keyboard variable
	* @param keyval new state of the keyboard variable
	* @return The updated keyboard variable
	* @example keyboard_set_new
	*/
	
	*keyid &= ~1;
	*keyid |= keyval&1;
	return *keyid;
}
int keyboard_set_old(int *keyid)
{
	/**
	* @brief Passively update a keyboard variable.
	* @param keyid pointer to a keyboard variable
	* @return The updated keyboard variable
	* @example keyboard_set_old
	*/
	
	*keyid &= ~2;
	*keyid |= (*keyid&1)<<1;
	return *keyid;
}
int keyboard_reset(int keyid)
{
	SDL_ResetKeyboard();
	keyid = 0;
	return keyid;
}
int keyboard_check(int key)
{
	/**
	* @brief Check if a keyboard key is held.
	* @param key Keyboard variable
	* @return int 
	* @example keyboard_check
	*/
	
	return (key&1);
}
int keyboard_check_pressed(int key)
{
	/**
	* @brief Check if a keyboard key is pressed.
	* @param key Keyboard variable
	* @return int 
	* @example keyboard_check_pressed
	*/
	
	return (key&1) && (!(key>>1));
}
int keyboard_check_released(int key)
{
	/**
	* @brief Check if a keyboard key is released.
	* @param key Keyboard variable
	* @return int 
	* @example keyboard_check_released
	*/
	
	return (!(key&1)) && (key>>1);
}
void keyboard_update_previous()
{
	keyboard_set_old(&glob_vk_right);
	keyboard_set_old(&glob_vk_left);
	keyboard_set_old(&glob_vk_up);
	keyboard_set_old(&glob_vk_down);
	keyboard_set_old(&glob_vk_space);
	keyboard_set_old(&glob_vk_enter);
	keyboard_set_old(&glob_vk_tab);
	keyboard_set_old(&glob_vk_pageup);
	keyboard_set_old(&glob_vk_pagedown);
	keyboard_set_old(&glob_vk_home);
	keyboard_set_old(&glob_vk_end);
	keyboard_set_old(&glob_vk_insert);
	keyboard_set_old(&glob_vk_delete);
	keyboard_set_old(&glob_vk_f1);
	keyboard_set_old(&glob_vk_f2);
	keyboard_set_old(&glob_vk_f3);
	keyboard_set_old(&glob_vk_f4);
	keyboard_set_old(&glob_vk_f5);
	keyboard_set_old(&glob_vk_f6);
	keyboard_set_old(&glob_vk_f7);
	keyboard_set_old(&glob_vk_f8);
	keyboard_set_old(&glob_vk_f9);
	keyboard_set_old(&glob_vk_f10);
	keyboard_set_old(&glob_vk_f11);
	keyboard_set_old(&glob_vk_f12);
	keyboard_set_old(&glob_vk_0);
	keyboard_set_old(&glob_vk_1);
	keyboard_set_old(&glob_vk_2);
	keyboard_set_old(&glob_vk_3);
	keyboard_set_old(&glob_vk_4);
	keyboard_set_old(&glob_vk_5);
	keyboard_set_old(&glob_vk_6);
	keyboard_set_old(&glob_vk_7);
	keyboard_set_old(&glob_vk_8);
	keyboard_set_old(&glob_vk_9);
	//keyboard_set_old(&glob_vk_);
	//keyboard_set_old(&glob_vk_);
}
void keyboard_sdl_polls(SDL_Event event)
{
	while (SDL_PollEvent(&event))
	{
		switch (event.type)
		{
			case SDL_QUIT:
			{
				//close using red cross or ALT+F4.
				running = 0;
				break;
			}
			case SDL_KEYDOWN:
			{
				//key held down or pressed
				int v=1;
				switch (event.key.keysym.sym)
				{
					case SDLK_ESCAPE:   {running=0;} break;//escape quits game.
					case SDLK_RIGHT:    {keyboard_set_new(&glob_vk_right,v);} break;
					case SDLK_LEFT:     {keyboard_set_new(&glob_vk_left,v);} break;
					case SDLK_UP:       {keyboard_set_new(&glob_vk_up,v);} break;
					case SDLK_DOWN:     {keyboard_set_new(&glob_vk_down,v);} break;
					case SDLK_SPACE:    {keyboard_set_new(&glob_vk_space,v);} break;
					case SDLK_RETURN:   {keyboard_set_new(&glob_vk_enter,v);} break;
					case SDLK_TAB:      {keyboard_set_new(&glob_vk_tab,v);} break;
					case SDLK_PAGEUP:   {keyboard_set_new(&glob_vk_pageup,v);} break;
					case SDLK_PAGEDOWN: {keyboard_set_new(&glob_vk_pagedown,v);} break;
					case SDLK_HOME:     {keyboard_set_new(&glob_vk_home,v);} break;
					case SDLK_END:      {keyboard_set_new(&glob_vk_end,v);} break;
					case SDLK_INSERT:   {keyboard_set_new(&glob_vk_insert,v);} break;
					case SDLK_DELETE:   {keyboard_set_new(&glob_vk_delete,v);} break;
					case SDLK_F1:       {keyboard_set_new(&glob_vk_f1,v);} break;
					case SDLK_F2:       {keyboard_set_new(&glob_vk_f2,v);} break;
					case SDLK_F3:       {keyboard_set_new(&glob_vk_f3,v);} break;
					case SDLK_F4:       {keyboard_set_new(&glob_vk_f4,v);} break;
					case SDLK_F5:       {keyboard_set_new(&glob_vk_f5,v);} break;
					case SDLK_F6:       {keyboard_set_new(&glob_vk_f6,v);} break;
					case SDLK_F7:       {keyboard_set_new(&glob_vk_f7,v);} break;
					case SDLK_F8:       {keyboard_set_new(&glob_vk_f8,v);} break;
					case SDLK_F9:       {keyboard_set_new(&glob_vk_f9,v);} break;
					case SDLK_F10:      {keyboard_set_new(&glob_vk_f10,v);} break;
					case SDLK_F11:      {keyboard_set_new(&glob_vk_f11,v);} break;
					case SDLK_F12:      {keyboard_set_new(&glob_vk_f12,v);} break;
					case SDLK_0:        {keyboard_set_new(&glob_vk_0,v);} break;
					case SDLK_1:        {keyboard_set_new(&glob_vk_1,v);} break;
					case SDLK_2:        {keyboard_set_new(&glob_vk_2,v);} break;
					case SDLK_3:        {keyboard_set_new(&glob_vk_3,v);} break;
					case SDLK_4:        {keyboard_set_new(&glob_vk_4,v);} break;
					case SDLK_5:        {keyboard_set_new(&glob_vk_5,v);} break;
					case SDLK_6:        {keyboard_set_new(&glob_vk_6,v);} break;
					case SDLK_7:        {keyboard_set_new(&glob_vk_7,v);} break;
					case SDLK_8:        {keyboard_set_new(&glob_vk_8,v);} break;
					case SDLK_9:        {keyboard_set_new(&glob_vk_9,v);} break;
					//case SDLK_:        {keyboard_set_new(&glob_vk_,v);} break;
					//case SDLK_:        {keyboard_set_new(&glob_vk_,v);} break;
					
				}
				break;
			}
			case SDL_KEYUP:
			{
				//key released
				int v=0;
				switch (event.key.keysym.sym)
				{
					case SDLK_RIGHT:    {keyboard_set_new(&glob_vk_right,v);} break;
					case SDLK_LEFT:     {keyboard_set_new(&glob_vk_left,v);} break;
					case SDLK_UP:       {keyboard_set_new(&glob_vk_up,v);} break;
					case SDLK_DOWN:     {keyboard_set_new(&glob_vk_down,v);} break;
					case SDLK_SPACE:    {keyboard_set_new(&glob_vk_space,v);} break;
					case SDLK_RETURN:   {keyboard_set_new(&glob_vk_enter,v);} break;
					case SDLK_TAB:      {keyboard_set_new(&glob_vk_tab,v);} break;
					case SDLK_PAGEUP:   {keyboard_set_new(&glob_vk_pageup,v);} break;
					case SDLK_PAGEDOWN: {keyboard_set_new(&glob_vk_pagedown,v);} break;
					case SDLK_HOME:     {keyboard_set_new(&glob_vk_home,v);} break;
					case SDLK_END:      {keyboard_set_new(&glob_vk_end,v);} break;
					case SDLK_INSERT:   {keyboard_set_new(&glob_vk_insert,v);} break;
					case SDLK_DELETE:   {keyboard_set_new(&glob_vk_delete,v);} break;
					case SDLK_F1:       {keyboard_set_new(&glob_vk_f1,v);} break;
					case SDLK_F2:       {keyboard_set_new(&glob_vk_f2,v);} break;
					case SDLK_F3:       {keyboard_set_new(&glob_vk_f3,v);} break;
					case SDLK_F4:       {keyboard_set_new(&glob_vk_f4,v);} break;
					case SDLK_F5:       {keyboard_set_new(&glob_vk_f5,v);} break;
					case SDLK_F6:       {keyboard_set_new(&glob_vk_f6,v);} break;
					case SDLK_F7:       {keyboard_set_new(&glob_vk_f7,v);} break;
					case SDLK_F8:       {keyboard_set_new(&glob_vk_f8,v);} break;
					case SDLK_F9:       {keyboard_set_new(&glob_vk_f9,v);} break;
					case SDLK_F10:      {keyboard_set_new(&glob_vk_f10,v);} break;
					case SDLK_F11:      {keyboard_set_new(&glob_vk_f11,v);} break;
					case SDLK_F12:      {keyboard_set_new(&glob_vk_f12,v);} break;
					case SDLK_0:        {keyboard_set_new(&glob_vk_0,v);} break;
					case SDLK_1:        {keyboard_set_new(&glob_vk_1,v);} break;
					case SDLK_2:        {keyboard_set_new(&glob_vk_2,v);} break;
					case SDLK_3:        {keyboard_set_new(&glob_vk_3,v);} break;
					case SDLK_4:        {keyboard_set_new(&glob_vk_4,v);} break;
					case SDLK_5:        {keyboard_set_new(&glob_vk_5,v);} break;
					case SDLK_6:        {keyboard_set_new(&glob_vk_6,v);} break;
					case SDLK_7:        {keyboard_set_new(&glob_vk_7,v);} break;
					case SDLK_8:        {keyboard_set_new(&glob_vk_8,v);} break;
					case SDLK_9:        {keyboard_set_new(&glob_vk_9,v);} break;
					//case SDLK_:        {keyboard_set_new(&glob_vk_,v);} break;
					//case SDLK_:        {keyboard_set_new(&glob_vk_,v);} break;
					
				}
				break;
			}
			
		}
	}
}