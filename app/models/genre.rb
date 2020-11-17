class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '空' },
    { id: 3, name: '海' },
    { id: 4, name: '山' },
    { id: 5, name: '川' },
    { id: 6, name: '湖沼' },
    { id: 7, name: '森林' },
    { id: 8, name: '花畑' },
    { id: 9, name: '草原' },
    { id: 10, name: '星・宇宙' },
  ]
end
