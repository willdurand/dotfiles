import re


def camel_case(word):
    cc_parts = [
        x[0].upper() + x[1:] for x in re.split("(?:_|-|\s)+", word) if len(x)
    ]
    return "".join(cc_parts)


def fmt_imported_lib(path):
    lastPart = path.split("/")[-1]
    if lastPart == "react":
        return "* as React"
    elif lastPart == "enzyme":
        return "{ shallow }"
    elif lastPart == "styles.module.scss":
        return "styles"

    if re.match("\w+[-_.]\w+", lastPart):
        name = camel_case(lastPart)
        return name[0].lower() + name[1:]
    return lastPart


def fmt_component_name(path):
    parts = path.split("/")
    component = parts.pop(-2) if len(parts) > 1 else "Component"
    return component + "Base"


def make_constant_name(name):
    return re.sub("([A-Z]+)", r"_\1", name).upper()


if __name__ == "__main__":
    import unittest

    class TestFmtImportedLib(unittest.TestCase):
        def test_react(self):
            self.assertEqual(fmt_imported_lib("react"), "* as React")

        def test_enzyme(self):
            self.assertEqual(fmt_imported_lib("enzyme"), "{ shallow }")

        def test_style(self):
            self.assertEqual(fmt_imported_lib("styles.module.scss"), "styles")

        def test_node_module_with_dash(self):
            self.assertEqual(fmt_imported_lib("safe-compare"), "safeCompare")

        def test_absolute_path(self):
            self.assertEqual(
                fmt_imported_lib("foo/bar/Component"), "Component"
            )

        def test_two_dashes(self):
            self.assertEqual(fmt_imported_lib("aa-bb-cc"), "aaBbCc")

        def test_trailing_dash(self):
            self.assertEqual(fmt_imported_lib("a-b-"), "aB")

    class TestFmtComponentName(unittest.TestCase):
        def test_default_component(self):
            self.assertEqual(fmt_component_name(""), "ComponentBase")

        def test_base_component(self):
            self.assertEqual(fmt_component_name("src/Foo/index.js"), "FooBase")

    class TestMakeConstantName(unittest.TestCase):
        def test_word(self):
            self.assertEqual(make_constant_name("foo"), "FOO")

        def test_with_underscores(self):
            self.assertEqual(make_constant_name("a_b_c"), "A_B_C")

    unittest.main()
