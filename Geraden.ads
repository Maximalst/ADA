with Ada.Text_IO;
with Ada.Float_Text_IO;

procedure Find_Intersection is

   -- Definiere die Funktionen f(x) = x^2 und g(x) = x^5
   function F(X : Float) return Float is
   begin
      return X ** 2;
   end F;

   function G(X : Float) return Float is
   begin
      return X ** 5;
   end G;

   -- Epsilon-Wert für Toleranz der Annäherung
   Epsilon : constant Float := 0.00001;

   -- Bereich, in dem wir nach dem Schnittpunkt suchen (z.B. -10 bis 10)
   Start_X : constant Float := -10.0;
   End_X   : constant Float := 10.0;
   Step    : constant Float := 0.01;

   -- Hilfsprozedur zur Anzeige eines Schnittpunkts
   procedure Display_Intersection(X : Float) is
   begin
      Ada.Text_IO.Put_Line("Schnittpunkt gefunden bei x = " & Float'Image(X) &
                           ", f(x) = " & Float'Image(F(X)) &
                           ", g(x) = " & Float'Image(G(X)));
   end Display_Intersection;

begin
   -- Numerische Suche im Bereich von Start_X bis End_X mit Schrittweite Step
   declare
      X : Float := Start_X;
   begin
      while X <= End_X loop
         -- Wenn die Funktionen nahe genug beieinander liegen, dann haben wir einen Schnittpunkt
         if abs(F(X) - G(X)) < Epsilon then
            Display_Intersection(X);
         end if;
         X := X + Step;
      end loop;
   end;

end Find_Intersection;
