Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9E017546E
	for <lists+openbmc@lfdr.de>; Mon,  2 Mar 2020 08:30:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WBcv3tzJzDqcM
	for <lists+openbmc@lfdr.de>; Mon,  2 Mar 2020 18:30:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=qq.com
 (client-ip=203.205.250.54; helo=smtpbg519.qq.com;
 envelope-from=1181052146@qq.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=D96gSTXQ; dkim-atps=neutral
Received: from smtpbg519.qq.com (smtpbg516.qq.com [203.205.250.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WBYQ5pKlzDqWZ
 for <openbmc@lists.ozlabs.org>; Mon,  2 Mar 2020 18:26:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1583134007; bh=o/pcE/r+VEysZeYAbUcP4pHyM1l/qk0AlvRk8Shb1tI=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=D96gSTXQSUWk3O3YFHIPSXCNQZleImGeNxWdmEaw+x59j+4475bbaQGZ4oolBHvGQ
 rlLtMYMNb4vYi2KWMNfTmMT4ZUExQly+VNENSFM8hbbJZ3SKbmuhlsMLlYVamOhJj3
 fzDfLwG/obf6Po/egnNWj+9qtajAYtacLHbk1VNU=
X-QQ-FEAT: EUGmOqWjSYK2Z3Hpe4NRExtFysTj3k5NnXvmI/a1i+OpQIe3Shmonrcz5SA3o
 /GsVcbeOOydfNhIiNUDH6XylH5fUCCWbwlc5pWfiqFZ0r/wCFu1TMX8KWdGE9wsLJ/qM+IE
 0lc7amDV2Rm5oYqZw0qt7CprYDAXCzZjzBdSV/sg25xq9j0HUcFPEhemX7XyL8x/cpy8qCc
 aFuktkibdRrD6Z3KTeAvlNvCetHMfsqVjkqWQ6KBB/apel6GEQwBFMARXr9k8XzShkFpAXg
 1qRSPdLINdKWEHNFNqoQ9BuKGv0TVIwr1YZg==
X-QQ-SSF: 00000000000000F000000000000000S
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 101.72.192.194
X-QQ-STYLE: 
X-QQ-mid: webmail700t1583133884t271217
From: "=?gb18030?B?xM/SsKXgpeult6WopemltA==?=" <1181052146@qq.com>
To: "=?gb18030?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>
Subject: What does openbmc system do after update BMC Firmware and taps reboot?
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5E5CB4BC_0FF74370_2B67D7F9"
Content-Transfer-Encoding: 8Bit
Date: Mon, 2 Mar 2020 15:24:44 +0800
X-Priority: 3
Message-ID: <tencent_50CE0F4E75A8AC62FF7879B0299213180707@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Mon, 02 Mar 2020 15:24:44 +0800 (CST)
Feedback-ID: webmail:qq.com:bgweb:bgweb1
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

This is a multi-part message in MIME format.

------=_NextPart_5E5CB4BC_0FF74370_2B67D7F9
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

R3JlZXRpbmdzOg0KDQpJIGFtIGxlYXJuaW5nIGhvdyBvcGVuYm1jIHVwZGF0ZSBCTUMgZmly
bXdhcmUuIEkgYW0gZm9sbG93aW5nIHRoZSBndWlkZSAiaHR0cHM6Ly9naXRodWIuY29tL29w
ZW5ibWMvZG9jcy9ibG9iL21hc3Rlci9jb2RlLXVwZGF0ZS9jb2RlLXVwZGF0ZS5tZCIgdG8g
dXBkYXRlIEJNQyBGaXJtd2FyZS4gSXQgd29ya3Mgd2VsbCBmb3IgbWUuDQpCdXQgSSBzdGls
bCBkbyBub3Qga25vdywgd2h5IGluIHN0ZXAgNyBzaG91bGQgSSByZWJvb3QsIGFuZCB3aGF0
IHJlYm9vdCBkbz8NCkxhdGVyIEkgZm91bmQgaW4gImh0dHBzOi8vZ2l0aHViLmNvbS9vcGVu
Ym1jL2RvY3MvYmxvYi9tYXN0ZXIvY29kZS11cGRhdGUvY29kZS11cGRhdGUtZGlhZ3JhbXMu
bWQiLCB3aGljaCB0ZWxscyB0aGF0Og0KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7IFsqXSBJbiBhIHN0YXRpYyBsYXlvdXQgY29uZmlndXJhdGlvbiwgdGhl
IGltYWdlcyBhcmUgc3RvcmVkIGluIFJBTSBhbmQgdGhlIGNvbnRlbnQgaXMgd3JpdHRlbiB0
byBmbGFzaCBkdXJpbmcgQk1DIHJlYm9vdC4gDQombmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsgUmVmZXJlbmNlIHRoZSB1cGRhdGUgYW5kIHNodXRkb3duIHNj
cmlwdHMgcHJvdmlkZWQgYnkgaW5pdHJkc2NyaXB0cw0KSSBhbSB1c2luZyBhIHN0YXRpYyBs
YXlvdXQuIEFuZCBJIGZvdW5kIHR3byBzY3JpcHRzIG5hbWVkICJzaHV0ZG93biIgYW5kICJ1
cGRhdGUiIGluICIvcnVuL2luaXRyYW1mcy8iLiBTbyBJIHRob3VnaHQgaXQgaXMgdGhhdCwg
dGhlIHVwZGF0ZSBhcHBsaWNhdGlvbnMgcHV0IHRoZSBmaXJtd2FyZSBpbWFnZSBpbiAvcnVu
L2luaXRyYW1mcy8gYW5kIHdoZW4gSSB0YXAgcmVib290LCBieSBzb21lIG1lYW5zIHRoZSAi
dXBkYXRlIiBzY3JpcHQgcnVucyBhbmQgdGhlICJ1cGRhdGUiIHNjcmlwdCB1c2luZyAiZmxh
c2hjcCIgY29tbWFuZCB0byB3cml0ZSB0aGUgZmlybXdhcmUgaW1hZ2UgdG8gdGhlIC9kZXYv
bXRkLiBJcyB0aGF0IHJpZ2h0Pw0KV2hhdCBoYXBwZW5zIGFmdGVyIEkgdGFwICJyZWJvb3Qi
LCBhbmQgd2hvIGNhbGxzIHRoZSAidXBkYXRlIiBzY3JpcHQsIGFuZCBob3cgaXQgY2FsbHMg
dGhlICJ1cGRhdGUiIHNjcmlwdHM/DQpDYW4gc29tZW9uZSB0ZWxsIG1lPyBUaGFua3MgYSBs
b3QhDQoNCkJlc3QgUmVnYXJkcyENCkxpdSBIb25nd2Vp

------=_NextPart_5E5CB4BC_0FF74370_2B67D7F9
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

R3JlZXRpbmdzOjxicj48YnI+SSBhbSBsZWFybmluZyBob3cgb3BlbmJtYyB1cGRhdGUgQk1D
IGZpcm13YXJlLiBJIGFtIGZvbGxvd2luZyB0aGUgZ3VpZGUgImh0dHBzOi8vZ2l0aHViLmNv
bS9vcGVuYm1jL2RvY3MvYmxvYi9tYXN0ZXIvY29kZS11cGRhdGUvY29kZS11cGRhdGUubWQi
IHRvIHVwZGF0ZSBCTUMgRmlybXdhcmUuIEl0IHdvcmtzIHdlbGwgZm9yIG1lLjxicj5CdXQg
SSBzdGlsbCBkbyBub3Qga25vdywgd2h5IGluIHN0ZXAgNyBzaG91bGQgSSByZWJvb3QsIGFu
ZCB3aGF0IHJlYm9vdCBkbz88YnI+TGF0ZXIgSSBmb3VuZCBpbiAiaHR0cHM6Ly9naXRodWIu
Y29tL29wZW5ibWMvZG9jcy9ibG9iL21hc3Rlci9jb2RlLXVwZGF0ZS9jb2RlLXVwZGF0ZS1k
aWFncmFtcy5tZCIsIHdoaWNoIHRlbGxzIHRoYXQ6PGJyPiZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBbKl0gSW4gYSBzdGF0aWMgbGF5b3V0IGNvbmZpZ3Vy
YXRpb24sIHRoZSBpbWFnZXMgYXJlIHN0b3JlZCBpbiBSQU0gYW5kIHRoZQpjb250ZW50IGlz
IHdyaXR0ZW4gdG8gZmxhc2ggZHVyaW5nIEJNQyByZWJvb3QuIDxicj4mbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgUmVmZXJlbmNlIHRoZSB1cGRhdGUgYW5k
CnNodXRkb3duIHNjcmlwdHMgcHJvdmlkZWQgYnkgPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIu
Y29tL29wZW5ibWMvb3BlbmJtYy90cmVlL21hc3Rlci9tZXRhLXBob3NwaG9yL3JlY2lwZXMt
cGhvc3Bob3IvaW5pdHJkc2NyaXB0cyI+aW5pdHJkc2NyaXB0czwvYT48YnI+SSBhbSB1c2lu
ZyBhIHN0YXRpYyBsYXlvdXQuIEFuZCBJIGZvdW5kIHR3byBzY3JpcHRzIG5hbWVkICJzaHV0
ZG93biIgYW5kICJ1cGRhdGUiIGluICIvcnVuL2luaXRyYW1mcy8iLiBTbyBJIHRob3VnaHQg
aXQgaXMgdGhhdCwgdGhlIHVwZGF0ZSBhcHBsaWNhdGlvbnMgcHV0IHRoZSBmaXJtd2FyZSBp
bWFnZSBpbiAvcnVuL2luaXRyYW1mcy8gYW5kIHdoZW4gSSB0YXAgcmVib290LCBieSBzb21l
IG1lYW5zIHRoZSAidXBkYXRlIiBzY3JpcHQgcnVucyBhbmQgdGhlICJ1cGRhdGUiIHNjcmlw
dCB1c2luZyAiZmxhc2hjcCIgY29tbWFuZCB0byB3cml0ZSB0aGUgZmlybXdhcmUgaW1hZ2Ug
dG8gdGhlIC9kZXYvbXRkLiBJcyB0aGF0IHJpZ2h0Pzxicj5XaGF0IGhhcHBlbnMgYWZ0ZXIg
SSB0YXAgInJlYm9vdCIsIGFuZCB3aG8gY2FsbHMgdGhlICJ1cGRhdGUiIHNjcmlwdCwgYW5k
IGhvdyBpdCBjYWxscyB0aGUgInVwZGF0ZSIgc2NyaXB0cz88YnI+Q2FuIHNvbWVvbmUgdGVs
bCBtZT8gVGhhbmtzIGEgbG90ITxicj48YnI+QmVzdCBSZWdhcmRzITxicj5MaXUgSG9uZ3dl
aTxicj4=

------=_NextPart_5E5CB4BC_0FF74370_2B67D7F9--

