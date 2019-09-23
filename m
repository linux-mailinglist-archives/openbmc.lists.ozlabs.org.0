Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0332AC880C
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2019 14:13:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jw576mYqzDqXv
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2019 22:12:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=163.com
 (client-ip=220.181.13.60; helo=m13-60.163.com;
 envelope-from=xiaoqian1641@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.b="Ulnry3ng"; 
 dkim-atps=neutral
Received: from m13-60.163.com (m13-60.163.com [220.181.13.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 46cG6W22syzDqL8
 for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2019 17:24:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=GjW1Y
 reSQz/uB1Iy0jHcDr4faZ42v4vrHW+NWCw9AbA=; b=Ulnry3ngHm5V1qXvnLoem
 zwO3aA3M2RCtZewhv4xvbOdtoiMSE8uN6JLg2nw1HSfC0uiMN+l8QdQmKXUWVv2M
 PWzWcW43j+LT8LsuUUUFaUIgHUd34IWIBsGYdvLO00jn2foh7btSwH49NwOA6B21
 5N6Baji38LUTPTc1eloR4c=
Received: from xiaoqian1641$163.com ( [106.120.127.15] ) by
 ajax-webmail-wmsvr60 (Coremail) ; Mon, 23 Sep 2019 15:24:24 +0800 (CST)
X-Originating-IP: [106.120.127.15]
Date: Mon, 23 Sep 2019 15:24:24 +0800 (CST)
From: =?GBK?B?s6PP/sP3?= <xiaoqian1641@163.com>
To: "OpenBMC Development" <openbmc@lists.ozlabs.org>
Subject: How to make OpenBMC Web automatically redirect  to HTTPS
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190724(ac680a23)
 Copyright (c) 2002-2019 www.mailtech.cn 163com
In-Reply-To: <CAPnigK=RCCa41ya98pgdmB+A1SK16o4XwbLBWa_g41vzgkm47g@mail.gmail.com>
References: <2d7b6a6d.52d2.16d2372efd5.Coremail.xiaoqian1641@163.com>
 <CAPnigK=RCCa41ya98pgdmB+A1SK16o4XwbLBWa_g41vzgkm47g@mail.gmail.com>
X-CM-CTRLDATA: ThoYJmZvb3Rlcl9odG09MTA2OTo1Ng==
Content-Type: multipart/alternative; 
 boundary="----=_Part_112906_98870577.1569223464425"
MIME-Version: 1.0
Message-ID: <30bad7e3.7644.16d5d01d5e9.Coremail.xiaoqian1641@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: PMGowADXDYkoc4hdhCfbAA--.32436W
X-CM-SenderInfo: 50ld01pldqiliur6il2tof0z/1tbiSgg5fFPAHxN0zQAAsh
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

------=_Part_112906_98870577.1569223464425
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

SGmjrEFsbCwKCgpXaGVuIEkgbG9naW4gT3BlbkJNQyBXZWIsIEkgbXVzdCBpbnB1dCAiaHR0cHM6
Ly8xMC4wLjE1LjQzIiBpbnN0ZWFkIG9mICIxMC4wLjE1LjQzIgoKCkhvdyB0byBtYWtlIE9wZW5C
TUMgV2ViIGF1dG9tYXRpY2FsbHkgcmVkaXJlY3QgIHRvIEhUVFBTID8KCgoKCkpvaG55ClRoYW5r
cwoKCgoKIA==
------=_Part_112906_98870577.1569223464425
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXYgc3R5bGU9ImxpbmUtaGVpZ2h0OiAxLjc7Ij48ZGl2IHN0
eWxlPSJjb2xvcjogcmdiKDAsIDAsIDApOyBmb250LWZhbWlseTogQXJpYWw7IGZvbnQtc2l6ZTog
MTRweDsiPkhpo6xBbGwsPC9kaXY+PGRpdiBzdHlsZT0iY29sb3I6IHJnYigwLCAwLCAwKTsgZm9u
dC1mYW1pbHk6IEFyaWFsOyBmb250LXNpemU6IDE0cHg7Ij48YnI+PC9kaXY+PGRpdiBzdHlsZT0i
Y29sb3I6IHJnYigwLCAwLCAwKTsgZm9udC1mYW1pbHk6IEFyaWFsOyBmb250LXNpemU6IDE0cHg7
Ij5XaGVuIEkgbG9naW4gT3BlbkJNQyBXZWIsIEkgbXVzdCBpbnB1dCAiPGEgaHJlZj0iaHR0cHM6
Ly8xMC4wLjE1LjQzJnF1b3Q7LCIgX3NyYz0iaHR0cHM6Ly8xMC4wLjE1LjQzJnF1b3Q7LCI+aHR0
cHM6Ly8xMC4wLjE1LjQzIjwvYT4mbmJzcDtpbnN0ZWFkIG9mICIxMC4wLjE1LjQzIjwvZGl2Pjxk
aXYgc3R5bGU9ImNvbG9yOiByZ2IoMCwgMCwgMCk7IGZvbnQtZmFtaWx5OiBBcmlhbDsgZm9udC1z
aXplOiAxNHB4OyI+PGJyPjwvZGl2PjxkaXYgc3R5bGU9IiI+SG93IHRvIG1ha2UgT3BlbkJNQyBX
ZWIgYXV0b21hdGljYWxseSByZWRpcmVjdCZuYnNwOyB0byBIVFRQUyA/PC9kaXY+PGRpdiBzdHls
ZT0iY29sb3I6IHJnYigwLCAwLCAwKTsgZm9udC1mYW1pbHk6IEFyaWFsOyBmb250LXNpemU6IDE0
cHg7Ij48YnI+PC9kaXY+PGRpdiBzdHlsZT0iY29sb3I6IHJnYigwLCAwLCAwKTsgZm9udC1mYW1p
bHk6IEFyaWFsOyBmb250LXNpemU6IDE0cHg7Ij48YnI+PC9kaXY+PGRpdiBzdHlsZT0iY29sb3I6
IHJnYigwLCAwLCAwKTsgZm9udC1mYW1pbHk6IEFyaWFsOyBmb250LXNpemU6IDE0cHg7Ij5Kb2hu
eTwvZGl2PjxkaXYgc3R5bGU9ImNvbG9yOiByZ2IoMCwgMCwgMCk7IGZvbnQtZmFtaWx5OiBBcmlh
bDsgZm9udC1zaXplOiAxNHB4OyI+VGhhbmtzPC9kaXY+PC9kaXY+PGJyPjxicj48c3BhbiB0aXRs
ZT0ibmV0ZWFzZWZvb3RlciI+PHA+Jm5ic3A7PC9wPjwvc3Bhbj48L2Rpdj48YnI+PGJyPjxzcGFu
IHRpdGxlPSJuZXRlYXNlZm9vdGVyIj48cD4mbmJzcDs8L3A+PC9zcGFuPg==
------=_Part_112906_98870577.1569223464425--

