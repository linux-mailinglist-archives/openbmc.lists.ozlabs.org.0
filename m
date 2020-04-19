Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E62561AFF20
	for <lists+openbmc@lfdr.de>; Mon, 20 Apr 2020 02:15:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4956f60l84zDqbC
	for <lists+openbmc@lfdr.de>; Mon, 20 Apr 2020 10:15:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=163.com
 (client-ip=220.181.13.90; helo=m13-90.163.com; envelope-from=slm_8269@163.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=ppLaPWiB; dkim-atps=neutral
X-Greylist: delayed 927 seconds by postgrey-1.36 at bilbo;
 Sun, 19 Apr 2020 13:19:08 AEST
Received: from m13-90.163.com (m13-90.163.com [220.181.13.90])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 494Zmr2NgdzDrMv
 for <openbmc@lists.ozlabs.org>; Sun, 19 Apr 2020 13:19:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=qe48z
 cYkvxsPCLRXmnabaZYyI8l1xqK5wqNej9lgtG0=; b=ppLaPWiB0cOBgYWomUinO
 gtX76/Z0XMX3TpsRT20rSGxQid5th2guEABLYBhaZTaxHMUOdkK5ErsvmSglkNe4
 7a2DoLAJozuKsQ9oK9ki5RXqfwexqX5KE6wXao+2/p6r3KIZKhtelkQUprACQ1yM
 GqvNR+xc9TdikJACHeLwIw=
Received: from slm_8269$163.com ( [183.195.58.221] ) by ajax-webmail-wmsvr90
 (Coremail) ; Sun, 19 Apr 2020 11:03:29 +0800 (CST)
X-Originating-IP: [183.195.58.221]
Date: Sun, 19 Apr 2020 11:03:29 +0800 (CST)
From: shi <slm_8269@163.com>
To: openbmc@lists.ozlabs.org
Subject: =?GBK?Q?how_run_=A3=A8export_TEMPLATECONF=3Dmeta-ibm?=
 =?GBK?Q?/meta-romulus/conf_=A3=A9_on_evb2500_board_?=
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190724(ac680a23)
 Copyright (c) 2002-2020 www.mailtech.cn 163com
X-CM-CTRLDATA: lDP36GZvb3Rlcl9odG09MjY3NDo1Ng==
Content-Type: multipart/alternative; 
 boundary="----=_Part_24222_1811932948.1587265409327"
MIME-Version: 1.0
Message-ID: <2b2bed16.185b.1719064112f.Coremail.slm_8269@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: WsGowADnZsWBv5tedqAWAA--.20053W
X-CM-SenderInfo: pvopsmqswzqiywtou0bp/1tbivwELIVWBpg0vrAAAso
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Approved-At: Mon, 20 Apr 2020 10:13:27 +1000
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

------=_Part_24222_1811932948.1587265409327
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

o8Sj5aPho/KjrAoKCgoKSSBhbSBub3cgZm9jdXMgb24gdGhlIEJNQ6OuCgpCdWlsZCBiYXNlZCBv
biB0aGUgb3BlbmJtYyBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1jLCB0aGVuIHdh
bnQgdG8gcnVuIG9uIGV2YjI1MDAgYm9hcmQgb2YgYXNwZWVkLCB3aGVuIGRvd25sb2FkIHRoZSBm
aXRpbWFnZSBieSB0ZnRwc2VydmVyIHRoZW4gYm9vdG0sIGFsd2F5cyBzdHVjayBvbiB0aGUgc3Rh
cnRpbmcga2VybmVsLiBUaGUgaGFyZHdhcmUgYWxzbyAyNTAwIHR5cGUuIFdoeSBub3Qgc3RhcnR1
cC4gSG93IEkgY2hhbmdlZCB0aGUgY29kZSBjYW4gYm9vdCB1cD8gICBJcyB0aGVyZSBhbnkgY2x1
ZSBvbiB0aGlzPwoKCgoKVGhhbmtzCgpTdGV2ZW4KCgo=
------=_Part_24222_1811932948.1587265409327
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXYgc3R5bGU9Im1hcmdpbjogMHB4OyI+PHAgc3R5bGU9Im1h
cmdpbjogMHB0OyI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiDLzszlOyBmb250LXNpemU6IDEw
LjVwdDsgbXNvLXNwYWNlcnVuOiAiIHllcz0iIiBtc28tYXNjaWktZm9udC1mYW1pbHk6PSIiIENh
bGlicmk9IiIgbXNvLWhhbnNpLWZvbnQtZmFtaWx5Oj0iIiBDYWxpYnJpPSIiIG1zby1iaWRpLWZv
bnQtZmFtaWx5Oj0iIiBOZXc9IiIgUm9tYW49IiIgbXNvLWZvbnQta2VybmluZzo9IiI+o8Sj5aPh
o/KjrDwvc3Bhbj48L3A+PHAgc3R5bGU9Im1hcmdpbjogMHB0OyI+PHNwYW4gc3R5bGU9ImZvbnQt
ZmFtaWx5OiDLzszlOyBmb250LXNpemU6IDEwLjVwdDsgbXNvLXNwYWNlcnVuOiAiIHllcz0iIiBt
c28tYXNjaWktZm9udC1mYW1pbHk6PSIiIENhbGlicmk9IiIgbXNvLWhhbnNpLWZvbnQtZmFtaWx5
Oj0iIiBDYWxpYnJpPSIiIG1zby1iaWRpLWZvbnQtZmFtaWx5Oj0iIiBOZXc9IiIgUm9tYW49IiIg
bXNvLWZvbnQta2VybmluZzo9IiI+PGJyPjwvc3Bhbj48L3A+PHAgc3R5bGU9Im1hcmdpbjogMHB0
OyI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiDLzszlOyBmb250LXNpemU6IDEwLjVwdDsgbXNv
LXNwYWNlcnVuOiAiIHllcz0iIiBtc28tYXNjaWktZm9udC1mYW1pbHk6PSIiIENhbGlicmk9IiIg
bXNvLWhhbnNpLWZvbnQtZmFtaWx5Oj0iIiBDYWxpYnJpPSIiIG1zby1iaWRpLWZvbnQtZmFtaWx5
Oj0iIiBOZXc9IiIgUm9tYW49IiIgbXNvLWZvbnQta2VybmluZzo9IiI+SSBhbSBub3cgZm9jdXMg
b24gdGhlIEJNQzxmb250IGZhY2U9IsvOzOUiPqOuPC9mb250Pjwvc3Bhbj48L3A+PHAgc3R5bGU9
Im1hcmdpbjogMHB0OyI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiDLzszlOyBmb250LXNpemU6
IDEwLjVwdDsgbXNvLXNwYWNlcnVuOiAiIHllcz0iIiBtc28tYXNjaWktZm9udC1mYW1pbHk6PSIi
IENhbGlicmk9IiIgbXNvLWhhbnNpLWZvbnQtZmFtaWx5Oj0iIiBDYWxpYnJpPSIiIG1zby1iaWRp
LWZvbnQtZmFtaWx5Oj0iIiBOZXc9IiIgUm9tYW49IiIgbXNvLWZvbnQta2VybmluZzo9IiI+QnVp
bGQgYmFzZWQgb24gdGhlIG9wZW5ibWMgPC9zcGFuPjxzcGFuPjxhIGhyZWY9Imh0dHBzOi8vZ2l0
aHViLmNvbS9vcGVuYm1jL29wZW5ibWMsIj48dT48c3BhbiBzdHlsZT0iY29sb3I6IHJnYigwLCAw
LCAyNTUpOyBmb250LWZhbWlseTogy87M5TsgdGV4dC1kZWNvcmF0aW9uOiB1bmRlcmxpbmU7IG1z
by1zcGFjZXJ1bjogIiB5ZXM9IiIgdGV4dC11bmRlcmxpbmU6PSIiIHNpbmdsZT0iIj5odHRwczov
L2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1jLDwvc3Bhbj48L3U+PC9hPjwvc3Bhbj48c3BhbiBz
dHlsZT0iZm9udC1mYW1pbHk6IMvOzOU7IGZvbnQtc2l6ZTogMTAuNXB0OyBtc28tc3BhY2VydW46
ICIgeWVzPSIiIG1zby1hc2NpaS1mb250LWZhbWlseTo9IiIgQ2FsaWJyaT0iIiBtc28taGFuc2kt
Zm9udC1mYW1pbHk6PSIiIENhbGlicmk9IiIgbXNvLWJpZGktZm9udC1mYW1pbHk6PSIiIE5ldz0i
IiBSb21hbj0iIiBtc28tZm9udC1rZXJuaW5nOj0iIj4mbmJzcDt0aGVuIHdhbnQgdG8gcnVuIG9u
IGV2YjI1MDAgYm9hcmQgb2YgYXNwZWVkLCB3aGVuIGRvd25sb2FkIHRoZSBmaXRpbWFnZSBieSB0
ZnRwc2VydmVyIHRoZW4gYm9vdG0sIGFsd2F5cyBzdHVjayBvbiB0aGUgc3RhcnRpbmcga2VybmVs
LiBUaGUgaGFyZHdhcmUgYWxzbyAyNTAwIHR5cGUuIFdoeSBub3Qgc3RhcnR1cC4gSG93IEkgY2hh
bmdlZCB0aGUgY29kZSBjYW4gYm9vdCB1cD8gJm5ic3A7Jm5ic3A7SXMgdGhlcmUgYW55IGNsdWUg
b24gdGhpcz8gPC9zcGFuPjwvcD48cCBzdHlsZT0ibWFyZ2luOiAwcHQ7Ij48c3BhbiBzdHlsZT0i
Zm9udC1mYW1pbHk6IMvOzOU7IGZvbnQtc2l6ZTogMTAuNXB0OyBtc28tc3BhY2VydW46ICIgeWVz
PSIiIG1zby1hc2NpaS1mb250LWZhbWlseTo9IiIgQ2FsaWJyaT0iIiBtc28taGFuc2ktZm9udC1m
YW1pbHk6PSIiIENhbGlicmk9IiIgbXNvLWJpZGktZm9udC1mYW1pbHk6PSIiIE5ldz0iIiBSb21h
bj0iIiBtc28tZm9udC1rZXJuaW5nOj0iIj48YnI+PC9zcGFuPjwvcD48cCBzdHlsZT0ibWFyZ2lu
OiAwcHQ7Ij48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6IMvOzOU7IGZvbnQtc2l6ZTogMTAuNXB0
OyBtc28tc3BhY2VydW46ICIgeWVzPSIiIG1zby1hc2NpaS1mb250LWZhbWlseTo9IiIgQ2FsaWJy
aT0iIiBtc28taGFuc2ktZm9udC1mYW1pbHk6PSIiIENhbGlicmk9IiIgbXNvLWJpZGktZm9udC1m
YW1pbHk6PSIiIE5ldz0iIiBSb21hbj0iIiBtc28tZm9udC1rZXJuaW5nOj0iIj5UaGFua3M8L3Nw
YW4+PC9wPjxwIHN0eWxlPSJtYXJnaW46IDBwdDsiPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTog
y87M5TsgZm9udC1zaXplOiAxMC41cHQ7IG1zby1zcGFjZXJ1bjogIiB5ZXM9IiIgbXNvLWFzY2lp
LWZvbnQtZmFtaWx5Oj0iIiBDYWxpYnJpPSIiIG1zby1oYW5zaS1mb250LWZhbWlseTo9IiIgQ2Fs
aWJyaT0iIiBtc28tYmlkaS1mb250LWZhbWlseTo9IiIgTmV3PSIiIFJvbWFuPSIiIG1zby1mb250
LWtlcm5pbmc6PSIiPlN0ZXZlbjwvc3Bhbj48L3A+PC9kaXY+PGRpdiBzdHlsZT0ibWFyZ2luOiAw
cHg7Ij48YnI+PC9kaXY+PC9kaXY+PGJyPjxicj48c3BhbiB0aXRsZT0ibmV0ZWFzZWZvb3RlciI+
PHA+Jm5ic3A7PC9wPjwvc3Bhbj4=
------=_Part_24222_1811932948.1587265409327--

