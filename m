Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 089A013A92E
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 13:23:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xqPD37Y2zDqJh
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 23:23:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yandex-team.ru (client-ip=77.88.29.217;
 helo=forwardcorp1p.mail.yandex.net; envelope-from=kitsok@yandex-team.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=yandex-team.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.a=rsa-sha256 header.s=default header.b=dVR8M+L0; 
 dkim-atps=neutral
X-Greylist: delayed 92 seconds by postgrey-1.36 at bilbo;
 Tue, 14 Jan 2020 23:22:26 AEDT
Received: from forwardcorp1p.mail.yandex.net (forwardcorp1p.mail.yandex.net
 [77.88.29.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xqN23NBQzDqGQ
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jan 2020 23:22:26 +1100 (AEDT)
Received: from mxbackcorp2j.mail.yandex.net (mxbackcorp2j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::119])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 37ED92E1512;
 Tue, 14 Jan 2020 15:20:32 +0300 (MSK)
Received: from localhost (localhost [::1])
 by mxbackcorp2j.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 Z4Yvd1GyFm-KWLODfCQ; Tue, 14 Jan 2020 15:20:32 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1579004432; bh=nOGY8fTiihVB4cec/qFRI9RXewmlDwY/OA+LDcp/Ek0=;
 h=Message-Id:Cc:Subject:In-Reply-To:Date:References:To:From;
 b=dVR8M+L0KaWxHoRCNM3K0oteBlFYmfVcbUxkCUXADLlhGsPA0hwiCF8N/751z8Q3J
 B3MOcfA/+rOAIOV/p7zcrOSAQ0yE/CjoeGB5aH8pANubJEo+S8lH0nPTOBso62Z2qA
 77CSzxvMgEjGrMzoy6NZxOehwvtzh/qIgCoCGhTk=
Authentication-Results: mxbackcorp2j.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000049860
Received: by iva4-6d0ca09d92db.qloud-c.yandex.net with HTTP;
 Tue, 14 Jan 2020 15:20:31 +0300
From: Konstantin Klubnichkin <kitsok@yandex-team.ru>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <FFFFBB27-4370-4E94-8D91-3BEB699CA3DA@fuzziesquirrel.com>
References: <02A2EB59-111F-43D2-8CDE-6DFDE75EF292@fuzziesquirrel.com>
 <1298611578998395@vla5-c30c59847b9e.qloud-c.yandex.net>
 <FFFFBB27-4370-4E94-8D91-3BEB699CA3DA@fuzziesquirrel.com>
Subject: Re: multiple device trees
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Tue, 14 Jan 2020 15:20:31 +0300
Message-Id: <2021151579004431@iva4-6d0ca09d92db.qloud-c.yandex.net>
Content-Transfer-Encoding: base64
Content-Type: text/html; charset=utf-8
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PGRpdj7CoDwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PjE0LjAxLjIwMjAsIDEzOjUyLCAiQnJhZCBC
aXNob3AiICZsdDticmFkbGV5YkBmdXp6aWVzcXVpcnJlbC5jb20mZ3Q7OjwvZGl2PjxibG9ja3F1
b3RlPjxwPjxiciAvPsKgPC9wPjxibG9ja3F1b3RlPsKgT24gSmFuIDE0LCAyMDIwLCBhdCA1OjM5
IEFNLCBLb25zdGFudGluIEtsdWJuaWNoa2luICZsdDs8YSBocmVmPSJtYWlsdG86a2l0c29rQHlh
bmRleC10ZWFtLnJ1Ij5raXRzb2tAeWFuZGV4LXRlYW0ucnU8L2E+Jmd0OyB3cm90ZTo8YnIgLz48
YnIgLz48YnIgLz7CoEhlbGxvLCBCcmFkITxiciAvPjxiciAvPsKgSSdtIGRvaW5nIHRoaXMgdXNp
bmcgb3ZlcmxheSBEVFMuPGJyIC8+wqBJIGhhdmUgYSBzdGFydHVwIHNjcmlwdCB0aGF0IGRldGVj
dHMgYm9hcmQgdHlwZSBieSBHUElPIHBpbnMgYW5kIGxvYWRzIGNvcnJlc3BvbmRpbmcgb3Zlcmxh
eS48L2Jsb2NrcXVvdGU+PHA+PGJyIC8+VGhhbmtzIGZvciB0aGUgcmVwbHkgS29uc3RhbnRpbi4g
RG9lcyB0aGF0IG1lYW4geW91IGhhdmUgdGhlIG92ZXJsYXkgcGF0Y2ggYXBwbGllZCB0byB5b3Vy
IGtlcm5lbCB0cmVlPzwvcD48L2Jsb2NrcXVvdGU+PGRpdj48YnIgLz5ZZXMsIHRha2UgYSBsb29r
IGF0IHRoaXMgY29tbWl0OiBodHRwczovL2dpdGh1Yi5jb20vWGlsaW54L2xpbnV4LXhsbngvY29t
bWl0LzM4MGU1ZDY1M2FiNTFhMzhhZjQ0MTFmYjE2ZjQ5Y2JkNmViM2I2OTAjZGlmZi1mZWYzZDgw
YzZmZjk1Mzg0ZjAwNzdkMjE0OWFiOGU4MTxiciAvPsKgPC9kaXY+PGJsb2NrcXVvdGU+PHA+QW4g
YWx0ZXJuYXRpdmUgZGVzaWduIHRoYXQgSSBhbSBjb25zaWRlcmluZyBpcyBoYXZpbmcgdHdvIGNv
bXBsZXRlIGRldmljZSB0cmVlcyBpbiBhIGZpdCBpbWFnZSwgYW5kIHUtYm9vdCByZWFkcyB0aGUg
Z3Bpb3MgdG8gcGljayB0aGUgY29ycmVjdCBkdGIgZm9yIGxpbnV4LiBEaWQgeW91IGNvbnNpZGVy
IGEgZGVzaWduIGxpa2UgdGhhdCBhbmQgaWYgc28sIHdhcyB0aGVyZSBhbnl0aGluZyBzcGVjaWZp
YyB0aGF0IHNlbnQgeW91IGluIHRoZSBkaXJlY3Rpb24gb2Ygb3ZlcmxheXM/PC9wPjwvYmxvY2tx
dW90ZT48ZGl2PjxiciAvPkkgdGhvdWdodCBhYm91dCBpdCwgYnV0IFUtQm9vdCBoYWNraW5nIGxv
b2tlZCBtb3JlIGNvbXBsZXgsIHBhcmljdWxhcmx5IGhhbmRsaW5nIG9mIGFsbCBwb3NzaWJsZSBl
eGNlcHRpb25zIGxpa2Ugd3JvbmcgY29tYmluYXRpb24gb2YgR1BJTyBwaW5zLjwvZGl2PjxkaXY+
wqA8L2Rpdj48ZGl2PkFsc28gSSBuZWVkIHRvIGluc3RhbnRpYXRlIGEgc3BlY2lmaWMgZGV2aWNl
IGRyaXZlciBpbiBhIHJ1bnRpbWUgb24gYSBjZXJ0YWluIGNvbmRpdGlvbiwgYW5kIG92ZXJsYXkg
d29ya3MganVzdCBmaW5lIGZvciB0aGlzLiBBbiBhbHRlcm5hdGl2ZSBjb3VsZCBiZSBhIG1vZHVs
ZXMgYnV0IG92ZXJsYXlzIGFyZSBhbHJlYWR5IHRoZXJlLjwvZGl2PjxkaXY+wqA8YmxvY2txdW90
ZT48cD50aHggLSBicmFkPC9wPjwvYmxvY2txdW90ZT48ZGl2PsKgPC9kaXY+PGRpdj7CoDwvZGl2
PjxkaXY+LS3CoDwvZGl2PjxkaXY+QmVzdCByZWdhcmRzLDwvZGl2PjxkaXY+S29uc3RhbnRpbiBL
bHVibmljaGtpbiw8L2Rpdj48ZGl2PmxlYWQgZmlybXdhcmUgZW5naW5lZXIsPC9kaXY+PGRpdj5z
ZXJ2ZXIgaGFyZHdhcmUgUiZhbXA7RCBncm91cCw8L2Rpdj48ZGl2PllhbmRleCBNb3Njb3cgb2Zm
aWNlLjwvZGl2PjxkaXY+dGVsOiArNy05MDMtNTEwLTMzLTMzPC9kaXY+PGRpdj7CoDwvZGl2Pjwv
ZGl2Pg==
