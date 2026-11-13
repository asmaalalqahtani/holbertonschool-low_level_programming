#!/bin/bash
# Advanced tasks 8-12 for "More pointers, arrays and strings".
# Run inside pointers_arrays_strings/

# --- main.h: add advanced prototypes if missing ---
if ! grep -q "char \*rot13" main.h 2>/dev/null; then
  if [ -f main.h ]; then
    sed -i.bak 's|#endif.*MAIN_H.*|/* Advanced tasks */\nchar *rot13(char *s);\nvoid print_number(int n);\nchar *infinite_add(char *n1, char *n2, char *r, int size_r);\nvoid print_buffer(char *b, int size);\n\n#endif /* MAIN_H */|' main.h && rm -f main.h.bak
  fi
fi

# --- Task 8: 100-rot13.c ---
cat > 100-rot13.c <<'EOF'
#include "main.h"

/**
 * rot13 - encodes a string using rot13
 * @s: the string to encode
 *
 * Return: a pointer to the encoded string s
 */
char *rot13(char *s)
{
	int i;
	int j;
	char *in = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	char *out = "nopqrstuvwxyzabcdefghijklmNOPQRSTUVWXYZABCDEFGHIJKLM";

	for (i = 0; s[i] != '\0'; i++)
	{
		for (j = 0; in[j] != '\0'; j++)
		{
			if (s[i] == in[j])
			{
				s[i] = out[j];
				break;
			}
		}
	}

	return (s);
}
EOF

# --- Task 9: 101-print_number.c ---
cat > 101-print_number.c <<'EOF'
#include "main.h"

/**
 * print_number - prints an integer using _putchar only
 * @n: the integer to print
 */
void print_number(int n)
{
	unsigned int num;

	if (n < 0)
	{
		_putchar('-');
		num = -(unsigned int)n;
	}
	else
		num = n;

	if (num / 10 != 0)
		print_number(num / 10);

	_putchar((num % 10) + '0');
}
EOF

# --- Task 10: 102-magic.c (exact original, line 19 changed) ---
cat > 102-magic.c <<'EOF'
#include <stdio.h>

int main(void)
{
  int n;
  int a[5];
  int *p;

  a[2] = 1024;
  p = &n;
  /*
   * write your line of code here...
   * Remember:
   * - you are not allowed to use a
   * - you are not allowed to modify p
   * - only one statement
   * - you are not allowed to code anything else than this line of code
   */
  *(p + 5) = 98;
  /* ...so that this prints 98\n */
  printf("a[2] = %d\n", a[2]);
  return (0);
}
EOF

# --- Task 11: 103-infinite_add.c ---
cat > 103-infinite_add.c <<'EOF'
#include "main.h"

/**
 * _len - returns the length of a string
 * @s: the string
 *
 * Return: the length of s
 */
int _len(char *s)
{
	int i;

	i = 0;
	while (s[i] != '\0')
		i++;

	return (i);
}

/**
 * infinite_add - adds two numbers stored as strings
 * @n1: the first number
 * @n2: the second number
 * @r: the buffer to store the result
 * @size_r: the size of the buffer r
 *
 * Return: a pointer to r, or 0 if the result cannot fit in r
 */
char *infinite_add(char *n1, char *n2, char *r, int size_r)
{
	int i1;
	int i2;
	int carry;
	int sum;
	int pos;
	int k;
	char tmp;

	i1 = _len(n1) - 1;
	i2 = _len(n2) - 1;
	carry = 0;
	pos = 0;

	while (i1 >= 0 || i2 >= 0 || carry > 0)
	{
		sum = carry;
		if (i1 >= 0)
			sum += n1[i1--] - '0';
		if (i2 >= 0)
			sum += n2[i2--] - '0';
		carry = sum / 10;
		if (pos >= size_r - 1)
			return (0);
		r[pos++] = (sum % 10) + '0';
	}

	r[pos] = '\0';

	for (k = 0; k < pos / 2; k++)
	{
		tmp = r[k];
		r[k] = r[pos - 1 - k];
		r[pos - 1 - k] = tmp;
	}

	return (r);
}
EOF

# --- Task 12: 104-print_buffer.c ---
cat > 104-print_buffer.c <<'EOF'
#include "main.h"
#include <stdio.h>

/**
 * print_buffer - prints a buffer in hexadecimal and printable form
 * @b: the buffer to print
 * @size: the number of bytes of b to print
 */
void print_buffer(char *b, int size)
{
	int i;
	int j;

	if (size <= 0)
	{
		printf("\n");
		return;
	}

	for (i = 0; i < size; i += 10)
	{
		printf("%08x: ", i);

		for (j = 0; j < 10; j++)
		{
			if (i + j < size)
				printf("%02x", (unsigned char)b[i + j]);
			else
				printf("  ");
			if (j % 2 != 0)
				printf(" ");
		}

		for (j = 0; j < 10 && i + j < size; j++)
		{
			if (b[i + j] >= 32 && b[i + j] <= 126)
				printf("%c", b[i + j]);
			else
				printf(".");
		}

		printf("\n");
	}
}
EOF
echo "All advanced files created."

