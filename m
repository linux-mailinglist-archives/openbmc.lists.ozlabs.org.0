Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A601EBAE92
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 09:38:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cGQg0WGKzDqLh
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 17:38:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=163.com
 (client-ip=220.181.13.60; helo=m13-60.163.com;
 envelope-from=xiaoqian1641@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.b="Yvhck/y/"; 
 dkim-atps=neutral
Received: from m13-60.163.com (m13-60.163.com [220.181.13.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 46cGQ40Q02zDqGb
 for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2019 17:38:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=Y83EN
 m2Eua2riq5Da3pphJy48SHUzJ6+pCShY74zZ60=; b=Yvhck/y/aU7f3XY++yxiB
 31RXz0ztFN8oGv13Lm+itt7WN1Llcb/FOUBPOFlkaiWscHzFUdrjyA74ucK9UVlg
 5LZo/Bo8RGUCWjZNF0e74gkM89pkM3VxQI8AkBFVn6iSCzM0FV1FwA++SlyAIyIT
 ZQtPeNq9GZtURsKDwO9gRY=
Received: from xiaoqian1641$163.com ( [106.120.127.15] ) by
 ajax-webmail-wmsvr60 (Coremail) ; Mon, 23 Sep 2019 15:37:59 +0800 (CST)
X-Originating-IP: [106.120.127.15]
Date: Mon, 23 Sep 2019 15:37:59 +0800 (CST)
From: =?GBK?B?s6PP/sP3?= <xiaoqian1641@163.com>
To: "OpenBMC Development" <openbmc@lists.ozlabs.org>
Subject: How to make OpenBMC Web automatically redirect  to HTTPS
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190724(ac680a23)
 Copyright (c) 2002-2019 www.mailtech.cn 163com
In-Reply-To: <CAPnigK=RCCa41ya98pgdmB+A1SK16o4XwbLBWa_g41vzgkm47g@mail.gmail.com>
References: <2d7b6a6d.52d2.16d2372efd5.Coremail.xiaoqian1641@163.com>
 <CAPnigK=RCCa41ya98pgdmB+A1SK16o4XwbLBWa_g41vzgkm47g@mail.gmail.com>
X-CM-CTRLDATA: CAZ/AWZvb3Rlcl9odG09MTM0NTo1Ng==
Content-Type: multipart/alternative; 
 boundary="----=_Part_116973_966374428.1569224279587"
MIME-Version: 1.0
Message-ID: <5426377a.7a85.16d5d0e4624.Coremail.xiaoqian1641@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: PMGowAD3LopXdohd5C3bAA--.24362W
X-CM-SenderInfo: 50ld01pldqiliur6il2tof0z/1tbiwBQ5fFXlnmgpJAABsb
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

------=_Part_116973_966374428.1569224279587
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

SGmjrEFsbCwKCgpXaGVuIEkgbG9naW4gT3BlbkJNQyBXZWIsIEkgbXVzdCBpbnB1dCAiaHR0cHM6
Ly8xMC4wLjE1LjQzIiBpbnN0ZWFkIG9mICIxMC4wLjE1LjQzIgoKCkhvdyB0byBtYWtlIE9wZW5C
TUMgV2ViIGF1dG9tYXRpY2FsbHkgcmVkaXJlY3QgIHRvIEhUVFBTID8KCgoKCkpvaG55ClRoYW5r
cwoKCgoKIAoKCgoKCiAKCgoKCgog
------=_Part_116973_966374428.1569224279587
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXYgc3R5bGU9ImxpbmUtaGVpZ2h0OjEuNztjb2xvcjojMDAw
MDAwO2ZvbnQtc2l6ZToxNHB4O2ZvbnQtZmFtaWx5OkFyaWFsIj48ZGl2IHN0eWxlPSJsaW5lLWhl
aWdodDoxLjc7Y29sb3I6IzAwMDAwMDtmb250LXNpemU6MTRweDtmb250LWZhbWlseTpBcmlhbCI+
PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6IDEuNzsiPjxkaXYgc3R5bGU9ImNvbG9yOiByZ2IoMCwg
MCwgMCk7IGZvbnQtZmFtaWx5OiBBcmlhbDsgZm9udC1zaXplOiAxNHB4OyI+SGmjrEFsbCw8L2Rp
dj48ZGl2IHN0eWxlPSJjb2xvcjogcmdiKDAsIDAsIDApOyBmb250LWZhbWlseTogQXJpYWw7IGZv
bnQtc2l6ZTogMTRweDsiPjxicj48L2Rpdj48ZGl2IHN0eWxlPSJjb2xvcjogcmdiKDAsIDAsIDAp
OyBmb250LWZhbWlseTogQXJpYWw7IGZvbnQtc2l6ZTogMTRweDsiPldoZW4gSSBsb2dpbiBPcGVu
Qk1DIFdlYiwgSSBtdXN0IGlucHV0ICI8YSBocmVmPSJodHRwczovLzEwLjAuMTUuNDMmcXVvdDss
IiBfc3JjPSJodHRwczovLzEwLjAuMTUuNDMmcXVvdDssIj5odHRwczovLzEwLjAuMTUuNDMiPC9h
PiZuYnNwO2luc3RlYWQgb2YgIjEwLjAuMTUuNDMiPC9kaXY+PGRpdiBzdHlsZT0iY29sb3I6IHJn
YigwLCAwLCAwKTsgZm9udC1mYW1pbHk6IEFyaWFsOyBmb250LXNpemU6IDE0cHg7Ij48YnI+PC9k
aXY+PGRpdiBzdHlsZT0iIj5Ib3cgdG8gbWFrZSBPcGVuQk1DIFdlYiBhdXRvbWF0aWNhbGx5IHJl
ZGlyZWN0Jm5ic3A7IHRvIEhUVFBTID88L2Rpdj48ZGl2IHN0eWxlPSJjb2xvcjogcmdiKDAsIDAs
IDApOyBmb250LWZhbWlseTogQXJpYWw7IGZvbnQtc2l6ZTogMTRweDsiPjxicj48L2Rpdj48ZGl2
IHN0eWxlPSJjb2xvcjogcmdiKDAsIDAsIDApOyBmb250LWZhbWlseTogQXJpYWw7IGZvbnQtc2l6
ZTogMTRweDsiPjxicj48L2Rpdj48ZGl2IHN0eWxlPSJjb2xvcjogcmdiKDAsIDAsIDApOyBmb250
LWZhbWlseTogQXJpYWw7IGZvbnQtc2l6ZTogMTRweDsiPkpvaG55PC9kaXY+PGRpdiBzdHlsZT0i
Y29sb3I6IHJnYigwLCAwLCAwKTsgZm9udC1mYW1pbHk6IEFyaWFsOyBmb250LXNpemU6IDE0cHg7
Ij5UaGFua3M8L2Rpdj48L2Rpdj48YnI+PGJyPjxzcGFuIHRpdGxlPSJuZXRlYXNlZm9vdGVyIj48
cD4mbmJzcDs8L3A+PC9zcGFuPjwvZGl2Pjxicj48YnI+PHNwYW4gdGl0bGU9Im5ldGVhc2Vmb290
ZXIiPjxwPiZuYnNwOzwvcD48L3NwYW4+PC9kaXY+PGJyPjxicj48c3BhbiB0aXRsZT0ibmV0ZWFz
ZWZvb3RlciI+PHA+Jm5ic3A7PC9wPjwvc3Bhbj48L2Rpdj48YnI+PGJyPjxzcGFuIHRpdGxlPSJu
ZXRlYXNlZm9vdGVyIj48cD4mbmJzcDs8L3A+PC9zcGFuPg==
------=_Part_116973_966374428.1569224279587--

