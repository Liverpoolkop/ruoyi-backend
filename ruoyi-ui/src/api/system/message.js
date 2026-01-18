import request from '@/utils/request'

// List Messages
export function listMessage(query) {
  return request({
    url: '/system/message/list',
    method: 'get',
    params: query
  })
}

// Get Unread Count
export function getUnreadCount() {
  return request({
    url: '/system/message/unread',
    method: 'get'
  })
}

// Read Message
export function readMessage(id) {
  return request({
    url: '/system/message/read/' + id,
    method: 'put'
  })
}

// Send Message
export function sendMessage(data) {
  return request({
    url: '/system/message',
    method: 'post',
    data: data
  })
}

// Delete Message
export function delMessage(id) {
  return request({
    url: '/system/message/' + id,
    method: 'delete'
  })
}
