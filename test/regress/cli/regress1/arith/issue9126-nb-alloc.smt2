; EXPECT: sat
(set-logic AUFNIRA)
(declare-const a Int)
(declare-const b Int)
(declare-const c Int)
(declare-const d Int)
(declare-const aa Int)
(declare-const e Int)
(declare-const f Int)
(declare-const g Int)
(declare-const h Int)
(declare-const i Int)
(declare-const j Int)
(declare-const k Int)
(declare-const l Int)
(declare-const m Int)
(declare-const n Int)
(declare-const o Int)
(declare-const p Int)
(declare-const q Int)
(declare-const r Int)
(declare-const s Int)
(declare-const ab Int)
(declare-const t Int)
(declare-const u Int)
(declare-const v Int)
(declare-const w Int)
(declare-const x Int)
(declare-const y Int)
(declare-const z Int)
(declare-const ac Int)
(declare-const ad Int)
(declare-const ae Int)
(declare-const af Int)
(declare-const ag Int)
(declare-const ah Int)
(declare-const ai Int)
(declare-const aj Int)
(declare-const ak Int)
(declare-const al Int)
(declare-const am Int)
(declare-const an Int)
(declare-const ao Int)
(declare-const ap Int)
(declare-const aq Int)
(declare-const ar Int)
(declare-const a193 Int)
(declare-const a200 Int)
(declare-const a202 Int)
(declare-const a203 Int)
(declare-const a205 Int)
(declare-const a213 Int)
(declare-const a214 Int)
(declare-const a215 Int)
(declare-const a216 Int)
(declare-const a217 Int)
(declare-const a218 Int)
(declare-const a226 Int)
(declare-const a227 Int)
(declare-const a228 Int)
(declare-const a229 Int)
(declare-const a237 Int)
(declare-const a238 Int)
(declare-const a239 Int)
(declare-const a240 Int)
(declare-const a248 Int)
(declare-const a249 Int)
(declare-const a250 Int)
(declare-const a251 Int)
(declare-const a252 Int)
(declare-const a262 Int)
(declare-const a263 Int)
(declare-const a273 Int)
(declare-const a274 Int)
(declare-const a285 Int)
(declare-const a286 Int)
(declare-const a291 Int)
(declare-const a294 Int)
(declare-const a304 Int)
(declare-const a305 Int)
(declare-const a306 Int)
(declare-const a316 Int)
(declare-const a317 Int)
(declare-const a318 Int)
(declare-const a327 Int)
(declare-const a328 Int)
(declare-const a329 Int)
(declare-const a330 Int)
(declare-const a340 Int)
(assert (= q v (+ t r)))
(assert (= w (+ a r)))
(assert (= x (+ u a) u r q))
(assert (= z ac (+ x s)))
(assert (= ad (+ y s)))
(assert (= 0 (+ z s)))
(assert (= ae af (+ ac ab)))
(assert (= ag (+ ad ab)))
(assert (= 0 (+ ae ab)))
(assert (= ah af))
(assert (= 0 (+ ag b)))
(assert (= aj (+ ah b)))
(assert (= ak (+ ai b) aj))
(assert (= (+ ak d) b 0 c))
(assert (= an (+ al d)))
(assert (= ap (+ am d) (+ an d)))
(assert (= aq (+ ao d)))
(assert (= a193 d (+ ap aa)))
(assert (= a202 (+ aq e) (+ ar aa) (+ a193 e)))
(assert (= 0 aa (+ a200 e)))
(assert (= a213 (+ a202 e)))
(assert (= a214 (+ a203 e)))
(assert (= a215 (+ a205 e)))
(assert (= e f))
(assert (= (+ a213 f) 0 (+ a214 f)))
(assert (= a226 (+ a215 f)))
(assert (= a227 (+ a216 f)))
(assert (= a228 (+ a217 f)))
(assert (= a229 (+ a218 f)))
(assert (= f g))
(assert (= a237 (+ a226 g)))
(assert (= a238 (+ a227 g)))
(assert (= a239 (+ a228 g) (+ a229 h)))
(assert (= g h))
(assert (= a248 (+ a237 h)))
(assert (= a249 (+ a238 h)))
(assert (= a250 (+ a239 h)))
(assert (= a251 (+ a240 h)))
(assert (= 0 h))
(assert (= (+ a248 i) 0 (+ a249 i) (+ a250 i)))
(assert (= a262 (+ a251 i)))
(assert (= a263 (+ a252 i)))
(assert (= i j))
(assert (= a273 (+ a262 j)))
(assert (= a274 (+ a263 j)))
(assert (= j 1 (+ a273 l)))
(assert (= a285 a274))
(assert (= a286 k a291))
(assert (= (+ a285 l) (+ a286 l) (+ a291 n) a304))
(assert (= a305 (+ a294 n)))
(assert (= a306 (+ 1 n) (+ a304 m)))
(assert (= a316 (+ a305 m)))
(assert (= a317 (+ a306 m)))
(assert (= m o))
(assert (= 1 (+ a316 o)))
(assert (= a328 (+ a317 o)))
(assert (= a329 (+ a318 o)))
(assert (= o (+ a327 p)))
(assert (= 1 (+ a328 p)))
(assert (= a340 (+ a329 p)))
(assert (= 1 (+ a330 p)))
(check-sat)
