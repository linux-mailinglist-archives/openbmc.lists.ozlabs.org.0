Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E41C880E
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2019 14:14:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jw6b2sBszDqZH
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2019 22:14:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=163.com
 (client-ip=220.181.13.60; helo=m13-60.163.com;
 envelope-from=xiaoqian1641@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.b="DGB77aqD"; 
 dkim-atps=neutral
Received: from m13-60.163.com (m13-60.163.com [220.181.13.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 46cGGN3h1NzDqFC
 for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2019 17:31:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=juMkd
 MiYVxuHyXjvuZEnL8/bJrDSwKzMqZGltGy4W0I=; b=DGB77aqDZTMIl4FkPIc60
 raj5msp933EBQ1//EZiv4q95azBOqUUxiEhGixAt/hFk30yfVvcYc3TudWO2RdTT
 w7358boggQfvUutMzeSQ6sGfCE/oQfiWmONVJV69OO9TMAZP1/JOdMgP4M9ibe90
 nCnjxgJZqJMXmpBZLjRdSM=
Received: from xiaoqian1641$163.com ( [106.120.127.15] ) by
 ajax-webmail-wmsvr60 (Coremail) ; Mon, 23 Sep 2019 15:31:20 +0800 (CST)
X-Originating-IP: [106.120.127.15]
Date: Mon, 23 Sep 2019 15:31:20 +0800 (CST)
From: =?GBK?B?s6PP/sP3?= <xiaoqian1641@163.com>
To: "OpenBMC Development" <openbmc@lists.ozlabs.org>
Subject: How to make OpenBMC Web automatically redirect  to HTTPS
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190724(ac680a23)
 Copyright (c) 2002-2019 www.mailtech.cn 163com
In-Reply-To: <CAPnigK=RCCa41ya98pgdmB+A1SK16o4XwbLBWa_g41vzgkm47g@mail.gmail.com>
References: <2d7b6a6d.52d2.16d2372efd5.Coremail.xiaoqian1641@163.com>
 <CAPnigK=RCCa41ya98pgdmB+A1SK16o4XwbLBWa_g41vzgkm47g@mail.gmail.com>
X-CM-CTRLDATA: jHYbeGZvb3Rlcl9odG09MTIwNzo1Ng==
Content-Type: multipart/alternative; 
 boundary="----=_Part_114889_538291347.1569223880672"
MIME-Version: 1.0
Message-ID: <3453213a.7858.16d5d082fe1.Coremail.xiaoqian1641@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: PMGowADH_YjIdIhdjirbAA--.32868W
X-CM-SenderInfo: 50ld01pldqiliur6il2tof0z/1tbiHQc5fFSIh6HeuAABsC
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Approved-At: Wed, 02 Oct 2019 22:06:35 +1000
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

------=_Part_114889_538291347.1569223880672
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

SGmjrEFsbCwKCgpXaGVuIEkgbG9naW4gT3BlbkJNQyBXZWIsIEkgbXVzdCBpbnB1dCAiaHR0cHM6
Ly8xMC4wLjE1LjQzIiBpbnN0ZWFkIG9mICIxMC4wLjE1LjQzIgoKCkhvdyB0byBtYWtlIE9wZW5C
TUMgV2ViIGF1dG9tYXRpY2FsbHkgcmVkaXJlY3QgIHRvIEhUVFBTID8KCgoKCkpvaG55ClRoYW5r
cwoKCgoKIAoKCgoKCiA=
------=_Part_114889_538291347.1569223880672
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXYgc3R5bGU9ImxpbmUtaGVpZ2h0OjEuNztjb2xvcjojMDAw
MDAwO2ZvbnQtc2l6ZToxNHB4O2ZvbnQtZmFtaWx5OkFyaWFsIj48ZGl2IHN0eWxlPSJsaW5lLWhl
aWdodDogMS43OyI+PGRpdiBzdHlsZT0iY29sb3I6IHJnYigwLCAwLCAwKTsgZm9udC1mYW1pbHk6
IEFyaWFsOyBmb250LXNpemU6IDE0cHg7Ij5IaaOsQWxsLDwvZGl2PjxkaXYgc3R5bGU9ImNvbG9y
OiByZ2IoMCwgMCwgMCk7IGZvbnQtZmFtaWx5OiBBcmlhbDsgZm9udC1zaXplOiAxNHB4OyI+PGJy
PjwvZGl2PjxkaXYgc3R5bGU9ImNvbG9yOiByZ2IoMCwgMCwgMCk7IGZvbnQtZmFtaWx5OiBBcmlh
bDsgZm9udC1zaXplOiAxNHB4OyI+V2hlbiBJIGxvZ2luIE9wZW5CTUMgV2ViLCBJIG11c3QgaW5w
dXQgIjxhIGhyZWY9Imh0dHBzOi8vMTAuMC4xNS40MyZxdW90OywiIF9zcmM9Imh0dHBzOi8vMTAu
MC4xNS40MyZxdW90OywiPmh0dHBzOi8vMTAuMC4xNS40MyI8L2E+Jm5ic3A7aW5zdGVhZCBvZiAi
MTAuMC4xNS40MyI8L2Rpdj48ZGl2IHN0eWxlPSJjb2xvcjogcmdiKDAsIDAsIDApOyBmb250LWZh
bWlseTogQXJpYWw7IGZvbnQtc2l6ZTogMTRweDsiPjxicj48L2Rpdj48ZGl2IHN0eWxlPSIiPkhv
dyB0byBtYWtlIE9wZW5CTUMgV2ViIGF1dG9tYXRpY2FsbHkgcmVkaXJlY3QmbmJzcDsgdG8gSFRU
UFMgPzwvZGl2PjxkaXYgc3R5bGU9ImNvbG9yOiByZ2IoMCwgMCwgMCk7IGZvbnQtZmFtaWx5OiBB
cmlhbDsgZm9udC1zaXplOiAxNHB4OyI+PGJyPjwvZGl2PjxkaXYgc3R5bGU9ImNvbG9yOiByZ2Io
MCwgMCwgMCk7IGZvbnQtZmFtaWx5OiBBcmlhbDsgZm9udC1zaXplOiAxNHB4OyI+PGJyPjwvZGl2
PjxkaXYgc3R5bGU9ImNvbG9yOiByZ2IoMCwgMCwgMCk7IGZvbnQtZmFtaWx5OiBBcmlhbDsgZm9u
dC1zaXplOiAxNHB4OyI+Sm9obnk8L2Rpdj48ZGl2IHN0eWxlPSJjb2xvcjogcmdiKDAsIDAsIDAp
OyBmb250LWZhbWlseTogQXJpYWw7IGZvbnQtc2l6ZTogMTRweDsiPlRoYW5rczwvZGl2PjwvZGl2
Pjxicj48YnI+PHNwYW4gdGl0bGU9Im5ldGVhc2Vmb290ZXIiPjxwPiZuYnNwOzwvcD48L3NwYW4+
PC9kaXY+PGJyPjxicj48c3BhbiB0aXRsZT0ibmV0ZWFzZWZvb3RlciI+PHA+Jm5ic3A7PC9wPjwv
c3Bhbj48L2Rpdj48YnI+PGJyPjxzcGFuIHRpdGxlPSJuZXRlYXNlZm9vdGVyIj48cD4mbmJzcDs8
L3A+PC9zcGFuPg==
------=_Part_114889_538291347.1569223880672--

