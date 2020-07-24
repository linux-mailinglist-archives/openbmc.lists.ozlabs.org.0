Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C5A22BC13
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 04:39:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCYLg1BtqzDrP2
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 12:39:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=chunhui.jia@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCYKk30ZVzDqLg
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jul 2020 12:38:33 +1000 (AEST)
IronPort-SDR: XdI2CSJqJr01w9KvlXRi/vOtSguKU0BwA68T07x4wiw5Qw2T3r+j0IK6paUgcWBGADr6fTTBeG
 e58vhSdEniZA==
X-IronPort-AV: E=McAfee;i="6000,8403,9691"; a="150636692"
X-IronPort-AV: E=Sophos;i="5.75,389,1589266800"; 
 d="scan'208,217";a="150636692"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2020 19:38:30 -0700
IronPort-SDR: /WSvzGnZvgOHJ8KcyX4EzK10NBJ3q+LXCt+6IaaNkfbs3tGZXlITpkl63RWkVppJ+BQOwcEsfS
 cEimDTsPDbwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,389,1589266800"; 
 d="scan'208,217";a="432944780"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga004.jf.intel.com with ESMTP; 23 Jul 2020 19:38:30 -0700
Received: from SHWDE9518 (SHWDE9518.ccr.corp.intel.com [10.239.164.117])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id D6C90580684;
 Thu, 23 Jul 2020 19:38:29 -0700 (PDT)
Date: Fri, 24 Jul 2020 10:38:30 +0800
From: "chunhui.jia" <chunhui.jia@linux.intel.com>
To: "=?utf-8?B?5LiN6K+t?=" <junhengdi@163.com>,
 "openbmc" <openbmc@lists.ozlabs.org>
Subject: Re: how to change debug uart from uart5 to uart1 on ast2500 romulus?
In-Reply-To: <5e18b54e.8d5f.1737b18e7dc.Coremail.junhengdi@163.com>
References: <5e18b54e.8d5f.1737b18e7dc.Coremail.junhengdi@163.com>
X-Mailer: NetEase FlashMail 2.4.1.32
X-Priority: 3 (Normal)
MIME-Version: 1.0
Message-ID: <5F1A49A2.5040900@linux.intel.com>
Content-Type: multipart/alternative;
 boundary="NetEase-FlashMail-003-6b7421f0-4a84-43cd-bd6c-a963989853c0"
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

--NetEase-FlashMail-003-6b7421f0-4a84-43cd-bd6c-a963989853c0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SXMgaXQgQVNUMjUwMC1FVkI/DQoNCjIwMjAtMDctMjQgDQoNCmNodW5odWkuamlhIA0KDQoNCg0K
5Y+R5Lu25Lq677ya5LiN6K+tIDxqdW5oZW5nZGlAMTYzLmNvbT4NCuWPkemAgeaXtumXtO+8mjIw
MjAtMDctMjMgMTc6NTQNCuS4u+mimO+8mmhvdyB0byBjaGFuZ2UgZGVidWcgdWFydCBmcm9tIHVh
cnQ1IHRvIHVhcnQxIG9uIGFzdDI1MDAgcm9tdWx1cz8NCuaUtuS7tuS6uu+8miJvcGVuYm1jIjxv
cGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQrmioTpgIHvvJoNCg0KRGVhciBvcGVtYm1jZXIsDQpJ
IGFtIGdyZWVuIHRvIG9wZW5ibWMgYW5kIEkgd2FudCB0byBsZWFybiBzb21ldGhpbmcgYWJvdXQg
YXN0MjUwMC5Ob3cgSSBoYXZlIG9uZSBib2FyZCBhc3QyNTAwIGFuZCANCnVzZSBvcGVuYm1jIGNv
ZGUgcm9tdWx1cy5JIGtub3cgdGhlIGRlZmF1bHQgZGVidWcgdWFydCBpcyB1YXJ0NSBhbmQgSSB3
YW50IHRvIGNoYW5nZSBpdCB0byB1YXJ0MSxiZWNhdXNlDQpvbiBteSBib2FyZCwgdWFydDEgaXMg
cnMyMzIuSSBoYXZlIHRyaWVkIHRoZXNlICxidXQgbm90IGVmZmVjdGl2ZS4NCigxKSBzZXQgdGhl
IGhhcmR3YXJlIHN0cmFwIHJlZ2lzdGVyIGJpdDI5IDAgb24gYXN0LWc1LmMNCigyKSBzZXQgQ09O
RklHX1NZU19OUzE2NTUwX0NPTTEgZnJvbSAweDFFNzg0MDAwIHRvIDB4MUU3ODMwMDANCg0KDQpB
bnkgYWRkdmljZSB3aWxsIGJlIGFwcHJpY2F0ZWQuDQogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBUaGFua3MsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBKdW5IZW5n

--NetEase-FlashMail-003-6b7421f0-4a84-43cd-bd6c-a963989853c0
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PCFET0NUWVBFIEhUTUwgUFVCTElDICItLy9XM0MvL0RURCBIVE1MIDQuMCBUcmFuc2l0aW9uYWwv
L0VOIj4NCjxIVE1MPjxIRUFEPg0KPE1FVEEgY29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0
Zi04IiBodHRwLWVxdWl2PUNvbnRlbnQtVHlwZT48IS0tIGZsYXNobWFpbCBzdHlsZSBiZWdpbiAt
LT4NCjxTVFlMRSB0eXBlPXRleHQvY3NzPgpib2R5IHtib3JkZXItd2lkdGg6MDttYXJnaW46MH0K
aW1nIHtib3JkZXI6MDttYXJnaW46MDtwYWRkaW5nOjB9CjwvU1RZTEU+DQo8QkFTRSB0YXJnZXQ9
X2JsYW5rPjwhLS0gZmxhc2htYWlsIHN0eWxlIGVuZCAtLT4NCjxNRVRBIG5hbWU9R0VORVJBVE9S
IGNvbnRlbnQ9Ik1TSFRNTCAxMS4wMC45NjAwLjE5Njk5Ij48L0hFQUQ+DQo8Qk9EWSANCnN0eWxl
PSJCT1JERVItTEVGVC1XSURUSDogMHB4OyBGT05ULVNJWkU6IDEwLjVwdDsgRk9OVC1GQU1JTFk6
IHRpbWVzIG5ldyByb21hbjsgQk9SREVSLVJJR0hULVdJRFRIOiAwcHg7IEJPUkRFUi1CT1RUT00t
V0lEVEg6IDBweDsgQ09MT1I6ICMwMDAwMDA7IE1BUkdJTjogMTJweDsgTElORS1IRUlHSFQ6IDEu
NTsgQk9SREVSLVRPUC1XSURUSDogMHB4IiANCm1hcmdpbmhlaWdodD0iMCIgbWFyZ2lud2lkdGg9
IjAiPg0KPERJVj5JcyBpdCBBU1QyNTAwLUVWQj88L0RJVj4NCjxESVY+Jm5ic3A7PC9ESVY+DQo8
RElWIHN0eWxlPSJGT05ULVNJWkU6IDEwcHQ7IEZPTlQtRkFNSUxZOiBWZXJkYW5hOyBDT0xPUjog
I2MwYzBjMCIgDQphbGlnbj1sZWZ0PjIwMjAtMDctMjQgDQo8SFIgaWQ9U2lnbk5hbWVIUiANCnN0
eWxlPSJCT1JERVItVE9QOiAjYzBjMGMwIDFweCBzb2xpZDsgSEVJR0hUOiAxcHg7IEJPUkRFUi1S
SUdIVDogMHB4OyBXSURUSDogMTIycHg7IEJPUkRFUi1CT1RUT006IDBweDsgQk9SREVSLUxFRlQ6
IDBweCIgDQphbGlnbj1sZWZ0Pg0KPFNQQU4gaWQ9X0ZsYXNoU2lnbk5hbWU+Y2h1bmh1aS5qaWE8
L1NQQU4+IDwvRElWPg0KPEhSIA0Kc3R5bGU9IkJPUkRFUi1UT1A6ICNjMGMwYzAgMXB4IHNvbGlk
OyBIRUlHSFQ6IDFweDsgQk9SREVSLVJJR0hUOiAwcHg7IEJPUkRFUi1CT1RUT006IDBweDsgQk9S
REVSLUxFRlQ6IDBweCI+DQoNCjxCTE9DS1FVT1RFIGlkPW50ZXMtZmxhc2htYWlsLXF1b3RlIA0K
c3R5bGU9IkZPTlQtU0laRTogMTBwdDsgRk9OVC1GQU1JTFk6IFZlcmRhbmE7IFBBRERJTkctTEVG
VDogMHB4OyBNQVJHSU4tTEVGVDogMHB4Ij4NCiAgPERJVj48U1RST05HPuWPkeS7tuS6uu+8mjwv
U1RST05HPuS4jeivrSAmbHQ7anVuaGVuZ2RpQDE2My5jb20mZ3Q7PC9ESVY+DQogIDxESVY+PFNU
Uk9ORz7lj5HpgIHml7bpl7TvvJo8L1NUUk9ORz4yMDIwLTA3LTIzJm5ic3A7MTc6NTQ8L0RJVj4N
CiAgPERJVj48U1RST05HPuS4u+mimO+8mjwvU1RST05HPmhvdyB0byBjaGFuZ2UgZGVidWcgdWFy
dCBmcm9tIHVhcnQ1IHRvIHVhcnQxIG9uIA0KICBhc3QyNTAwIHJvbXVsdXM/PC9ESVY+DQogIDxE
SVY+PFNUUk9ORz7mlLbku7bkurrvvJo8L1NUUk9ORz4ib3BlbmJtYyImbHQ7b3BlbmJtY0BsaXN0
cy5vemxhYnMub3JnJmd0OzwvRElWPg0KICA8RElWPjxTVFJPTkc+5oqE6YCB77yaPC9TVFJPTkc+
PC9ESVY+DQogIDxESVY+Jm5ic3A7PC9ESVY+DQogIDxESVY+DQogIDxESVYgDQogIHN0eWxlPSJG
T05ULVNJWkU6IDE0cHg7IEZPTlQtRkFNSUxZOiBBcmlhbDsgQ09MT1I6ICMwMDAwMDA7IExJTkUt
SEVJR0hUOiAxLjciPg0KICA8UCBzdHlsZT0iTUFSR0lOOiAwcHgiPkRlYXIgb3BlbWJtY2VyLDwv
UD4NCiAgPFAgc3R5bGU9Ik1BUkdJTjogMHB4Ij48U1BBTiBjbGFzcz1BcHBsZS10YWItc3BhbiAN
CiAgc3R5bGU9IldISVRFLVNQQUNFOiBwcmUiPjwvU1BBTj5JIGFtIGdyZWVuIHRvIG9wZW5ibWMg
YW5kIEkgd2FudCB0byBsZWFybiANCiAgc29tZXRoaW5nIGFib3V0IGFzdDI1MDAuTm93IEkgaGF2
ZSBvbmUgYm9hcmQgYXN0MjUwMCBhbmQmbmJzcDs8L1A+DQogIDxQIHN0eWxlPSJNQVJHSU46IDBw
eCI+dXNlIG9wZW5ibWMgY29kZSByb211bHVzLkkga25vdyB0aGUgZGVmYXVsdCBkZWJ1ZyB1YXJ0
IA0KICBpcyB1YXJ0NSBhbmQgSSB3YW50IHRvIGNoYW5nZSBpdCB0byB1YXJ0MSxiZWNhdXNlPC9Q
Pg0KICA8UCBzdHlsZT0iTUFSR0lOOiAwcHgiPm9uIG15IGJvYXJkLCB1YXJ0MSBpcyByczIzMi5J
IGhhdmUgdHJpZWQgdGhlc2UgLGJ1dCBub3QgDQogIGVmZmVjdGl2ZS48L1A+DQogIDxQIHN0eWxl
PSJNQVJHSU46IDBweCI+KDEpIHNldCB0aGUgaGFyZHdhcmUgc3RyYXAgcmVnaXN0ZXIgYml0Mjkg
MCBvbiANCiAgYXN0LWc1LmM8L1A+DQogIDxQIHN0eWxlPSJNQVJHSU46IDBweCI+KDIpIHNldCBD
T05GSUdfU1lTX05TMTY1NTBfQ09NMSBmcm9tIDB4MUU3ODQwMDAgdG8gDQogIDB4MUU3ODMwMDA8
L1A+DQogIDxQIHN0eWxlPSJNQVJHSU46IDBweCI+PEJSPjwvUD4NCiAgPFAgc3R5bGU9Ik1BUkdJ
TjogMHB4Ij48U1BBTiBjbGFzcz1BcHBsZS10YWItc3BhbiANCiAgc3R5bGU9IldISVRFLVNQQUNF
OiBwcmUiPjwvU1BBTj5BbnkgYWRkdmljZSB3aWxsIGJlIGFwcHJpY2F0ZWQuPC9QPg0KICA8UCBz
dHlsZT0iTUFSR0lOOiAwcHgiPjxTUEFOIGNsYXNzPUFwcGxlLXRhYi1zcGFuIA0KICBzdHlsZT0i
V0hJVEUtU1BBQ0U6IHByZSI+PC9TUEFOPiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7IA0KICAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IA0KICAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwO1RoYW5rcyw8L1A+DQogIDxQIHN0eWxlPSJNQVJHSU46IDBw
eCI+PFNQQU4gY2xhc3M9QXBwbGUtdGFiLXNwYW4gDQogIHN0eWxlPSJXSElURS1TUEFDRTogcHJl
Ij48L1NQQU4+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgDQogICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgDQogICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7SnVuSGVuZzwvUD48L0RJVj48QlI+PEJSPjxTUEFOIA0KICB0aXRsZT1uZXRlYXNlZm9v
dGVyPg0KICA8UD4mbmJzcDs8L1A+PC9TUEFOPjwvRElWPjwvQkxPQ0tRVU9URT48L0JPRFk+PC9I
VE1MPg==

--NetEase-FlashMail-003-6b7421f0-4a84-43cd-bd6c-a963989853c0--

