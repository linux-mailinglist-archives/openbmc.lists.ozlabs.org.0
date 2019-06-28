Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 925CC59946
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 13:31:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZvjK6XnjzDqpH
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 21:31:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.250.2; helo=mail1.bemta24.messagelabs.com;
 envelope-from=pengms1@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zvhl3qwkzDqZD
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jun 2019 21:30:46 +1000 (AEST)
Received: from [67.219.251.54] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-c.us-west-2.aws.symcld.net id FB/6A-14524-26AF51D5;
 Fri, 28 Jun 2019 11:30:42 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjk+JIrShJLcpLzFFi42JJl3vFppv4SzT
 WYPMaa4sXS/eyWMzY+4DZ4lTLCxaLvQc2sjiweCzYVOpxfsZCRo9z1/qYA5ijWDPzkvIrElgz
 Lm0SL7jWy1zxbPNsxgbGqz+Zuhi5OIQE/jNK3NszjRXCeckoseP9chY45+Obq1BlexglXkz4D
 JTh5GAT0JJY+H8PE4gtIhAm8axjJyuIzSxQKbGq8x6YLSxQJ7G54Q4zRE2wxIMZm9khbCeJL2
 2LwXpZBFQlVuzbzwhi8wpYSrS+vQF1xlFGiVVPL4At4xQIlJg0eS2YzSggKzHt0X0miGXiEnO
 nzQJbJiEgILFkz3lmCFtU4uXjf1BxBYmr95ZA1SdIvD/7mwVimaDEyZlPWCYwis5CMmoWkrJZ
 SMog4loS8xp+M0HYihJTuh+yQ9iaElcmH4KytSWWLXzNvICRfRWjRVJRZnpGSW5iZo6uoYGBr
 qGhka6hsYWuoYmFXmKVbrJeabFueWpxia6RXmJ5sV5xZW5yTopeXmrJJkZgRKcUdE3Zwfhm5h
 u9Q4ySHExKoryLP4vGCvEl5adUZiQWZ8QXleakFh9i1ODgEOg4enQNoxRLXn5eqpIE7+mfQHW
 CRanpqRVpmTnApANTKsHBoyTCawOS5i0uSMwtzkyHSJ1i9OaY8HLuImaOg0fnAcnvzQuB5MdV
 S0BsMHlk7tJFzEJgG6TEeR1ARgiAjMgozYNbAEuelxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzM
 CoJ834GmcKTmVcCd8croBOZgE5MaBUCObEkESEl1cDEIlKUNePKjqdfDS5da5SoK43m4171xG
 p9+RkFjrNzW1IL/sodebp/Y3jPu9sLdX3vh1mJbvu+puNo2Pu3D0U/3hWtVV9w4m5Orv70zNC
 CVVNKk1SKf9n/Xtm7ZLqrIpvXa34hB+cYGc6nvzWiDHt51Fwtfk/OPVnbWrGT6WbEgpItb3ND
 Pxj3sPJed98kwJAox8QpYMv+c3r9qZgDJUuLUnazRGTYizcezjY6tfR5/2rB5yzuu55l5qf/5
 Xv0/QSfieSkrRfMy8Iuyi572hGe+nb94eWyj81zz55YL2Y28Yja+ix/tylTf4QoXNLZdEb67b
 9VHzfE/TilpzLp2F9LTluW4y8lvd6ouVxY2/5BiaU4I9FQi7moOBEAra5AOxkEAAA=
X-Env-Sender: pengms1@lenovo.com
X-Msg-Ref: server-4.tower-366.messagelabs.com!1561721438!375795!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8837 invoked from network); 28 Jun 2019 11:30:40 -0000
Received: from unknown (HELO apsmtp.lenovo.com) (103.30.234.6)
 by server-4.tower-366.messagelabs.com with DHE-RSA-AES256-GCM-SHA384 encrypted
 SMTP; 28 Jun 2019 11:30:40 -0000
Received: from pekwpmail01.lenovo.com (unknown [10.96.93.79])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id F10B42305427417E3AC7;
 Fri, 28 Jun 2019 19:30:37 +0800 (CST)
Received: from pekwpmail07.lenovo.com (10.96.17.29) by pekwpmail01.lenovo.com
 (10.96.93.79) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Fri, 28 Jun
 2019 19:30:37 +0800
Received: from pekwpmail05.lenovo.com (10.96.93.83) by pekwpmail07.lenovo.com
 (10.96.17.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Fri, 28 Jun
 2019 19:30:37 +0800
Received: from pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf]) by
 pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf%7]) with mapi id
 15.01.1591.008; Fri, 28 Jun 2019 19:30:37 +0800
From: Andrew MS1 Peng <pengms1@lenovo.com>
To: Patrick Venture <venture@google.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: =?gb2312?B?tPC4tDogW0V4dGVybmFsXSAgUmU6IENsYXJpZnkgc29tZSBxdWVzdGlvbnMg?=
 =?gb2312?Q?about_in-band_firmware_update?=
Thread-Topic: [External]  Re: Clarify some questions about in-band firmware
 update
Thread-Index: AdUrylJQKNpqnX+PQOKNLKlbBlBXQQAIEDuAABeOWgAAQlnIUA==
Date: Fri, 28 Jun 2019 11:30:37 +0000
Message-ID: <027a78e697414daaa44d775062fdb93e@lenovo.com>
References: <26428e13a88d4ea7bcee9c792b892c7c@lenovo.com>
 <CAO=notyr4whyR8TN5awOVTTrQDMU8kXQYiqBAOUR_fU3dZo0cg@mail.gmail.com>
 <CAO=notwh-2iLhAMHbXd8RzvbBgZWAMLkAwGSLwoPyhL=+SAp8g@mail.gmail.com>
In-Reply-To: <CAO=notwh-2iLhAMHbXd8RzvbBgZWAMLkAwGSLwoPyhL=+SAp8g@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.96.12.252]
Content-Type: multipart/alternative;
 boundary="_000_027a78e697414daaa44d775062fdb93elenovocom_"
MIME-Version: 1.0
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
Cc: Adriana Kobylak <anoo@us.ibm.com>,
 "benjaminfair@google.com" <benjaminfair@google.com>,
 Duke KH Du <dukh@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_027a78e697414daaa44d775062fdb93elenovocom_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgUGF0cmljaywNCg0KSSBzeW5jaHJvbml6ZWQgb3VyIE9wZW5ibWMgcmVwb3NpdG9yeSB3aXRo
IHVwc3RyZWFtIHJlcG9zaXRvcnkgdGhlbiBjb21waWxlZCBhbmQgY2hlY2tlZCB0aGUgcmVzdWx0
IHllc3RlcmRheSwgd2UgY2FuIGdlbmVyYXRlIGR5bmFtaWNhbGx5IGxpbmtlZCBiaW5hcnkgYnV0
IHN0aWxsIGZhaWxlZCB0byBnZW5lcmF0ZSBzdGF0aWNhbGx5IGxpbmtlZCBiaW5hcnkuICBJIHVz
ZWQgT3BlbkJtYyBlbnZpcm9ubWVudCB0byBjb21waWxlIGFuZCBhbHNvIGNyZWF0ZWQgYSBTREsg
ZW52aXJvbm1lbnQgYnkgdXNpbmcgeDg2LTY0IHRvb2xjaGFpbiAob2Vjb3JlLXg4Nl82NC1jb3Jl
Mi02NC10b29sY2hhaW4tbm9kaXN0cm8uMC5zaCkgdG8gY29tcGlsZSwgdGhlIGNvbXBpbGUgcmVz
dWx0IGlzIHRoZSBzYW1lLiBJdCBzZWVtcyB0byB0aGUgbGlua2VyIG5vdCBmaW5kIHRoZSBhcmNo
aXZlIGZpbGUgbGlicGNpLmEsIGNvdWxkIHlvdSB0YWtlIGEgbG9vayBteSBwcm9ibGVtPyBUaGFu
a3MuDQoNCkkgd2lsbCBnZXQgZXJyb3IgbWVzc2FnZSB3aGVuIEkgcnVuIHRoZSB0b29sIGluIG15
IGhvc3QgcGxhdGZvcm0gYXMgYmVsb3cuIFRoZSBkeW5hbWljYWxseSBsaW5rZWQgYmluYXJ5IGlz
IG5vdCBjb252ZW5pZW5jZSB0byB1c2Ugc2luY2UgSSBoYXZlIHRvIG1vZGlmeSBycGF0aCBhbmQg
aW50ZXJwcmV0ZXIgb2YgYWxyZWFkeSBjb21waWxlZCBFTEYuDQpwZW5nbXMxQGhzYm1jOiAkIC4v
YnVybl9teV9ibWMNCi1iYXNoOiAuL2J1cm5fbXlfYm1jOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0
b3J5DQoNCnBlbmdtczFAaHNibWM6ICQgbGRkIC4vYnVybl9teV9ibWMNCi4vYnVybl9teV9ibWM6
IC9saWIveDg2XzY0LWxpbnV4LWdudS9saWJwY2kuc28uMzogdmVyc2lvbiBgTElCUENJXzMuNScg
bm90IGZvdW5kIChyZXF1aXJlZCBieSAuL2J1cm5fbXlfYm1jKQ0KICAgICAgIGxpbnV4LXZkc28u
c28uMSA9PiAgKDB4MDAwMDdmZmNkMjM2MzAwMCkNCiAgICAgICBsaWJpcG1pYmxvYi5zby4wID0+
IC9ob21lL3BlbmdtczEvU0RLL09wZW5CbWMvcm9vdGZzL2xpYi9saWJpcG1pYmxvYi5zby4wICgw
eDAwMDA3ZjI1ZDM3M2EwMDApDQogICAgICAgbGlicGNpLnNvLjMgPT4gL2xpYi94ODZfNjQtbGlu
dXgtZ251L2xpYnBjaS5zby4zICgweDAwMDA3ZjI1ZDM1MTIwMDApDQogICAgICAgbGlic3RkYysr
LnNvLjYgPT4gL3Vzci9saWIveDg2XzY0LWxpbnV4LWdudS9saWJzdGRjKysuc28uNiAoMHgwMDAw
N2YyNWQzMTkwMDAwKQ0KICAgICAgIGxpYmdjY19zLnNvLjEgPT4gL2xpYi94ODZfNjQtbGludXgt
Z251L2xpYmdjY19zLnNvLjEgKDB4MDAwMDdmMjVkMmY3OTAwMCkNCiAgICAgICBsaWJjLnNvLjYg
PT4gL2xpYi94ODZfNjQtbGludXgtZ251L2xpYmMuc28uNiAoMHgwMDAwN2YyNWQyYmFmMDAwKQ0K
ICAgICAgIGxpYm0uc28uNiA9PiAvbGliL3g4Nl82NC1saW51eC1nbnUvbGlibS5zby42ICgweDAw
MDA3ZjI1ZDI4YTYwMDApDQogICAgICAgbGliei5zby4xID0+IC9saWIveDg2XzY0LWxpbnV4LWdu
dS9saWJ6LnNvLjEgKDB4MDAwMDdmMjVkMjY4YjAwMCkNCiAgICAgICBsaWJyZXNvbHYuc28uMiA9
PiAvbGliL3g4Nl82NC1saW51eC1nbnUvbGlicmVzb2x2LnNvLjIgKDB4MDAwMDdmMjVkMjQ3MDAw
MCkNCiAgICAgICBsaWJ1ZGV2LnNvLjEgPT4gL2xpYi94ODZfNjQtbGludXgtZ251L2xpYnVkZXYu
c28uMSAoMHgwMDAwN2YyNWQyNDUwMDAwKQ0KICAgICAgIC9saWIvbGQtbGludXgteDg2LTY0LnNv
LjIgPT4gL2xpYjY0L2xkLWxpbnV4LXg4Ni02NC5zby4yICgweDAwMDA1NTczMTE5M2IwMDApDQog
ICAgICAgbGlicnQuc28uMSA9PiAvbGliL3g4Nl82NC1saW51eC1nbnUvbGlicnQuc28uMSAoMHgw
MDAwN2YyNWQyMjQ3MDAwKQ0KICAgICAgIGxpYnB0aHJlYWQuc28uMCA9PiAvbGliL3g4Nl82NC1s
aW51eC1nbnUvbGlicHRocmVhZC5zby4wICgweDAwMDA3ZjI1ZDIwMmEwMDApDQoNClRoZSBjb21w
aWxlIGVycm9yIG1lc3NhZ2UgaXMgYmVsb3c6DQp4ODZfNjQtb3BlbmJtYy1saW51eC1saWJ0b29s
OiBsaW5rOiB4ODZfNjQtb3BlbmJtYy1saW51eC1nKysgLW02NCAtbWFyY2g9Y29yZTIgLW10dW5l
PWNvcmUyIC1tc3NlMyAtbWZwbWF0aD1zc2UgLS1zeXNyb290PS9ob21lL3BlbmdtczEvb3BlbmJt
Y190cnVua194ODYvYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtb3BlbmJtYy1saW51eC9waG9zcGhv
ci1pcG1pLWZsYXNoLzAuMStnaXRBVVRPSU5DKzdjNzliMjUyYzEtcjEvcmVjaXBlLXN5c3Jvb3Qg
LXN0ZD1jKysxNyAtSS4uLy4uL2dpdCAtTzIgLXBpcGUgLWcgLWZlbGltaW5hdGUtdW51c2VkLWRl
YnVnLXR5cGVzIC1mbWFjcm8tcHJlZml4LW1hcD0vaG9tZS9wZW5nbXMxL29wZW5ibWNfdHJ1bmtf
eDg2L2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LW9wZW5ibWMtbGludXgvcGhvc3Bob3ItaXBtaS1m
bGFzaC8wLjErZ2l0QVVUT0lOQys3Yzc5YjI1MmMxLXIxPS91c3Ivc3JjL2RlYnVnL3Bob3NwaG9y
LWlwbWktZmxhc2gvMC4xK2dpdEFVVE9JTkMrN2M3OWIyNTJjMS1yMSAtZmRlYnVnLXByZWZpeC1t
YXA9L2hvbWUvcGVuZ21zMS9vcGVuYm1jX3RydW5rX3g4Ni9idWlsZC90bXAvd29yay9jb3JlMi02
NC1vcGVuYm1jLWxpbnV4L3Bob3NwaG9yLWlwbWktZmxhc2gvMC4xK2dpdEFVVE9JTkMrN2M3OWIy
NTJjMS1yMT0vdXNyL3NyYy9kZWJ1Zy9waG9zcGhvci1pcG1pLWZsYXNoLzAuMStnaXRBVVRPSU5D
KzdjNzliMjUyYzEtcjEgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL3BlbmdtczEvb3BlbmJtY190
cnVua194ODYvYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtb3BlbmJtYy1saW51eC9waG9zcGhvci1p
cG1pLWZsYXNoLzAuMStnaXRBVVRPSU5DKzdjNzliMjUyYzEtcjEvcmVjaXBlLXN5c3Jvb3Q9IC1m
ZGVidWctcHJlZml4LW1hcD0vaG9tZS9wZW5nbXMxL29wZW5ibWNfdHJ1bmtfeDg2L2J1aWxkL3Rt
cC93b3JrL2NvcmUyLTY0LW9wZW5ibWMtbGludXgvcGhvc3Bob3ItaXBtaS1mbGFzaC8wLjErZ2l0
QVVUT0lOQys3Yzc5YjI1MmMxLXIxL3JlY2lwZS1zeXNyb290LW5hdGl2ZT0gLWZ2aXNpYmlsaXR5
LWlubGluZXMtaGlkZGVuIC1XYWxsIC1XZXJyb3IgLURFTkFCTEVfUkVCT09UX1VQREFURSAtREVO
QUJMRV9TVEFUSUNfTEFZT1VUIC1ERU5BQkxFX0xQQ19CUklER0UgLURBU1BFRURfTFBDIC1zdGF0
aWMgLW8gYnVybl9teV9ibWMgYnVybl9teV9ibWMtbWFpbi5vICAuLy5saWJzL2xpYnVwZGF0ZXIu
YSAtbGlwbWlibG9iIC1scGNpDQp8IC9ob21lL3BlbmdtczEvb3BlbmJtY190cnVua194ODYvYnVp
bGQvdG1wL3dvcmsvY29yZTItNjQtb3BlbmJtYy1saW51eC9waG9zcGhvci1pcG1pLWZsYXNoLzAu
MStnaXRBVVRPSU5DKzdjNzliMjUyYzEtcjEvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4v
eDg2XzY0LW9wZW5ibWMtbGludXgvLi4vLi4vbGliZXhlYy94ODZfNjQtb3BlbmJtYy1saW51eC9n
Y2MveDg2XzY0LW9wZW5ibWMtbGludXgvOS4xLjAvbGQ6IGNhbm5vdCBmaW5kIC1scGNpDQoNCk15
IE9wZW5CbWMgYnVpbGQgZW52aXJvbm1lbnQgaXMgYmVsb3cuDQpPcGVuQm1jIFNldHRpbmcNCg0K
cGhvc3Bob3ItaXBtaS1mbGFzaCBzZXR0aW5nIChidWlsZCBzdGF0aWMgYmluYXJ5KQ0KDQpFeHRy
YSBzZXR0aW5nDQoNCkJ1aWxkIENvbmZpZ3VyYXRpb246DQpCQl9WRVJTSU9OICAgICAgICAgICA9
ICIxLjQzLjAiDQpCVUlMRF9TWVMgICAgICAgICAgICA9ICJ4ODZfNjQtbGludXgiDQpOQVRJVkVM
U0JTVFJJTkcgICAgICA9ICJ1YnVudHUtMTYuMDQiDQpUQVJHRVRfU1lTICAgICAgICAgICA9ICJ4
ODZfNjQtb3BlbmJtYy1saW51eCINCk1BQ0hJTkUgICAgICAgICAgICAgID0gInFlbXV4ODYtNjQi
DQpESVNUUk8gICAgICAgICAgICAgICA9ICJvcGVuYm1jLXBob3NwaG9yIg0KRElTVFJPX1ZFUlNJ
T04gICAgICAgPSAiMC4xLjIiDQpUVU5FX0ZFQVRVUkVTICAgICAgICA9ICJtNjQgY29yZTIiDQpU
QVJHRVRfRlBVICAgICAgICAgICA9ICIiDQoNCkVYVFJBX09FQ09ORiArPSAiIC0tZW5hYmxlLWJ1
aWxkLWhvc3QtdG9vbCAtLWVuYWJsZS1zdGF0aWMtbGF5b3V0IC0tZW5hYmxlLWxwYy1icmlkZ2UN
Ci0tZW5hYmxlLWFzcGVlZC1scGMgTUFQUEVEX0FERFJFU1M9MHg5ODAwMDAwMCAtLWVuYWJsZS1y
ZWJvb3QtdXBkYXRlICINCg0KRVhUUkFfT0VNQUtFICs9ICIgTERGTEFHUz0tYWxsLXN0YXRpYyAi
IChCdWlsZCBhIHN0YXRpY2FsbHkgbGlua2VkIGJpbmFyeSkNCg0KRElTQUJMRV9TVEFUSUMgPSAi
IiAgKEJ1aWxkIHN0YXRpY2FsbHkgbGlicmFyeSBmb3IgaXBtaS1ibG9iLXRvb2wpDQoNCnBob3Nw
aG9yLWlwbWktZmxhc2ggc2V0dGluZyAoYnVpbGQgZHluYW1pYyBiaW5hcnkpDQoNCkVYVFJBX09F
Q09ORiArPSAiIC0tZW5hYmxlLWJ1aWxkLWhvc3QtdG9vbCAtLWVuYWJsZS1zdGF0aWMtbGF5b3V0
IC0tZW5hYmxlLWxwYy1icmlkZ2UNCi0tZW5hYmxlLWFzcGVlZC1scGMgTUFQUEVEX0FERFJFU1M9
MHg5ODAwMDAwMCAtLWVuYWJsZS1yZWJvb3QtdXBkYXRlICINCg0KDQpSZWdhcmRzLA0KQW5kcmV3
DQoNCreivP7IyzogUGF0cmljayBWZW50dXJlIDx2ZW50dXJlQGdvb2dsZS5jb20+DQq3osvNyrG8
5DogMjAxOcTqNtTCMjfI1SA5OjU5DQrK1bz+yMs6IEFuZHJldyBNUzEgUGVuZyA8cGVuZ21zMUBs
ZW5vdm8uY29tPjsgT3BlbkJNQyBNYWlsbGlzdCA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0K
s63LzTogRHVrZSBLSCBEdSA8ZHVraEBsZW5vdm8uY29tPjsgYmVuamFtaW5mYWlyQGdvb2dsZS5j
b207IEFkcmlhbmEgS29ieWxhayA8YW5vb0B1cy5pYm0uY29tPg0K1vfM4jogW0V4dGVybmFsXSBS
ZTogQ2xhcmlmeSBzb21lIHF1ZXN0aW9ucyBhYm91dCBpbi1iYW5kIGZpcm13YXJlIHVwZGF0ZQ0K
DQoNCg0KT24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgNzo0NCBBTSBQYXRyaWNrIFZlbnR1cmUgPHZl
bnR1cmVAZ29vZ2xlLmNvbTxtYWlsdG86dmVudHVyZUBnb29nbGUuY29tPj4gd3JvdGU6DQoNCg0K
T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgNDoyOCBBTSBBbmRyZXcgTVMxIFBlbmcgPHBlbmdtczFA
bGVub3ZvLmNvbTxtYWlsdG86cGVuZ21zMUBsZW5vdm8uY29tPj4gd3JvdGU6DQpIaSBQYXRyaWNr
LA0KDQpJIGhhdmUgc29tZSBxdWVzdGlvbnMgYXMgYmVsb3csIGNvdWxkIHlvdSBoZWxwIHRvIGNs
YXJpZnkuIFRoYW5rcy4NCg0KMS4gICAgICBEbyB5b3UgaGF2ZSBhbnkgcGxhbnMgdG8gc3VwcG9y
dCBCSU9TIHVwZGF0ZSBpbiBwaG9zcGhvci1pcG1pLWZsYXNoPw0KDQpJZiB0aGUgYW5zd2VyIGlz
IG5vLCB3ZSB3b3VsZCBsaWtlIHRvIGhlbHAgdG8gYWRkIHRoaXMgZmVhdHVyZS4gQ291bGQgeW91
IGdpdmUgdXMgc29tZSBhZHZpY2Ugb3IgY2x1ZXMgdG8gaW1wbGVtZW50IGl0Lg0KDQpUaGlzIGNv
dWxkIGJlIGFkZGVkIHRvIHRoZSBkZXNpZ24gKGZpcnN0IHN0ZXApLg0KSSBjb3VsZCBwcm9iYWJs
eSByb2xsIG91dCB0aGlzIGluIGEgZGF5IG9yIHR3bywgaXQncyBub3QgYSBkaWZmaWN1bHQgZXh0
ZW5zaW9uIHdpdGggYSBmZXcgY2F2ZWF0cy4gV2UnZCBoYXZlIHRvIGRlZmluZSBuZXcgc2Vydmlj
ZXMsIHN1Y2ggYXMgdXBkYXRlX2Jpb3Muc2VydmljZSBpbnN0ZWFkIG9mIHVwZGF0ZV9ibWMuc2Vy
dmljZS4NCg0KSSBoYXZlIHNvbWUgY3ljbGVzLCBzbyBJIGRvbid0IG1pbmQgcmV2aWV3aW5nIHRo
ZSBjaGFuZ2VzIHJlcXVpcmVkIGFuZCByb2xsaW5nIHNvbWV0aGluZyBvdXQgLS0NCg0KDQoyLiAg
ICAgIFRoZSBGUEdBIHJvbSBpbWFnZSBpcyBlbWJlZGRlZCBpbiBCTUMgaW1hZ2UsIHdlIHdvdWxk
IGxpa2UgdG8gYWRkIGZwZ2EtdXBkYXRlLnNlcnZpY2UgYW5kIGZwZ2EtdmVyaWZ5LnNlcnZpY2Ug
aW4gcGhvc3Bob3ItaXBtaS1mbGFzaCwgd2UgZXhwZWN0IHRoYXQgcnVuIGJvdGggc2VydmljZXMg
YWZ0ZXIgdXBkYXRlIEJNQyBpbWFnZSBjb21wbGV0ZWx5LiBEbyB5b3UgaGF2ZSBhbnkgY29uY2Vy
bnMgYWJvdXQgaXQ/DQoNClRoZXJlIGFyZSBhIGNvdXBsZSB0aGluZ3MgdG8gdW5wYWNrIGhlcmUu
ICBUaGUgRlBHQSByb20gaXMgZW1iZWRkZWQgaW4gdGhlIEJNQyBpbWFnZS4gIEhvdyBpcyB0aGUg
Qk1DIHVwZGF0ZWQ/ICBJIGFzayBiZWNhdXNlIGEgbWFjaGluZSBjYW4gKGFuZCBpcyBleHBlY3Rl
ZCB0bykgcHJvdmlkZSBpdHMgb3duIHVwZGF0ZV9ibWMuc2VydmljZSBpbXBsZW1lbnRhdGlvbi4g
IFRoaXMgc2VydmljZSBjb3VsZCB0cmlnZ2VyIHRoZSBmcGdhLXZlcmlmeSBhbmQgZnBnYS11cGRh
dGUgc2VydmljZXMgd2l0aGluIHdoYXRldmVyIGNvZGUgaXMgY2FsbGVkIGZyb20gdGhlIHVwZGF0
ZV9ibWMgc2VydmljZSB5b3Ugc3BlY2lmeS4NCg0KDQozLiAgICAgIEhvdyBjYW4gSSBtYWtlIGEg
c3RhdGljIGV4ZWN1dGFibGUgaG9zdCB0b29sIChidXJuX215X2JtYyk/IEN1cnJlbnRseSwgSSBj
YW6hr3QgdG8gbWFrZSBhIHN0YXRpY2FsbHkgbGlua2VkIGJpbmFyeSBzdWNjZXNzZnVsbHksIGJ1
dCBJIGhhdmUgbWFkZSBpdCBiZWZvcmUgeW91IGFkZGVkIHAyYSBmdW5jdGlvbi4NCkZvciB0aGUg
aG9zdCB0b29sIHlvdSBuZWVkIHRvIHNwZWNpZnkgdmVyeSBsaXR0bGUsIHlvdSBzaG91bGQgYmUg
YWJsZSB0byBidWlsZCBpdCB2aWE6DQouL2Jvb3RzdHJhcC5zaA0KLi9jb25maWd1cmUNCi4vbWFr
ZQ0KDQpZb3Ugd2lsbCBuZWVkIHRvIGNoZWNrb3V0IGFuZCBpbnN0YWxsIGlwbWktYmxvYi10b29s
IGZpcnN0IChvcGVuYm1jL2lwbWktYmxvYi10b29sKQ0KDQoNCl5eIC0tLSB0aG9zZSBzdGVwcyBz
aG91bGQgZ28gb24gdGhlIFJFQURNRS4gIFdpbGwgYWRkIHRoZW0gc2hvcnRseS4NCg0KDQpCYXNl
ZCBvbiBkaWZmZXJlbnQgT1MgZW52aXJvbm1lbnQgYXMgYmVsb3csIEkgd291bGQgbGlrZSB0byBo
YXZlIGEgc3RhdGljIGV4ZWN1dGFibGUgc2luY2UgZHluYW1pY2FsbHkgbGlua2VkIGJpbmFyeSBj
YW6hr3Qgd29yayBub3JtYWxseSBpbiBob3N0IE9TLg0KDQpIb3N0IE9TIGVudmlyb25tZW50DQoN
Cg0KQnVpbGQgZW52aXJvbm1lbnQgKE9wZW5CbWMpDQoNCg0KR2NjICB2NC44LjUNCg0KDQpHY2Mg
ICB2OC4zLjANCg0KDQpHbGliYyAgdjIuMTcNCg0KDQpHbGliYyAgdjIuMjkNCg0KDQpUaGUgYml0
YmFrZSByZWNpcGUgaXNuJ3QgbWVhbnQgdG8gYmUgdXNlZCBmb3IgdGhlIGhvc3QgdG9vbC4gIEl0
IGV4cGxpY2l0bHkgZGlzYWJsZXMgYnVpbGRpbmcgdGhlIGhvc3QtdG9vbCBieSBkZWZhdWx0LiAg
WW91IHNob3VsZCBiZSBhYmxlIHRvIGNoZWNrIG91dCB0aGUgcmVwbyBhbmQgYnVpbGQgZnJvbSB0
aGVyZS4gIExldCBtZSBrbm93IGlmIHlvdSBydW4gaW50byBpc3N1ZXMgd2l0aCB0aGF0Lg0KDQoN
CjQuICAgICAgSSBkaWRuoa90IGZpbmQgdGhlIGJlbG93IHNlcnZpY2UgZmlsZXMgaW4gc291cmNl
IHRyZWUsIHdoZXJlIGNhbiBmaW5kIGRlZmF1bHQgc2VydmljZXMgb3Igc2hvdWxkIHdlIHByb3Zp
ZGUgb3VyIG93biBzZXJ2aWNlcz8NCg0KdXBkYXRlX2JtYy5zZXJ2aWNlDQp2ZXJpZnlfaW1hZ2Uu
c2VydmljZQ0KcHJlcGFyZV91cGRhdGUuc2VydmljZQ0KDQpUaGF0J3MgY29ycmVjdC4gIFRoZXJl
IGFyZSBjdXJyZW50bHkgbm8gZGVmYXVsdCBzZXJ2aWNlIGZpbGVzLiAgSSBhbSB0aGlua2luZyBv
ZiBwcm92aWRpbmcgYSBkZWZhdWx0IHByZXBhcmVfdXBkYXRlIHNlcnZpY2UgaW4gYSBsYXRlciBD
TCwgaG93ZXZlciB1cGRhdGluZyB0aGUgQk1DIG9yIHZlcmlmeWluZyB0aGUgaW1hZ2UgZGVwZW5k
IGVudGlyZWx5IG9uIHRoZSBzeXN0ZW0gLS0gd2hpY2ggbWFrZXMgaXQgZGlmZmljdWx0IHRvIGhh
dmUgYSBkZWZhdWx0LiAgSW4gcG9pbnQgb2YgZmFjdCwgdGhlcmUgaXNuJ3QgcmVhbGx5IGEgdmFs
aWQgZGVmYXVsdCBwaG9zcGhvci1pcG1pLWZsYXNoIGJ1aWxkIGZvciBhIEJNQy4gIEV2ZXJ5dGhp
bmcgbmVlZHMgdG8gYmUgc3BlY2lmaWVkLg0KDQpeLS0tIEkgY2FuIHdvcmsgb24gbWFraW5nIHRo
ZSB1YmkgYm1jIG9wdGlvbiBhdmFpbGFibGUgaWYgdGhlIHViaSBkaXN0cm8gZmVhdHVyZSBpcyBl
bmFibGVkLCBldGMgLS0gcHJvdmlkaW5nIHNvbWUgZGVmYXVsdHMuDQpeLS0tIEkgaGF2ZSBhIHBs
YW4gdG8gcHJvdmlkZSBhIHByZXBhcmVfdXBkYXRlLnNlcnZpY2Ugb25jZSBJIGZpbmlzaCB0ZXN0
aW5nIEFzcGVlZCBMUEMgc3VwcG9ydC4NCg0KDQpJJ3ZlIGJlZW4gcmV2aWV3aW5nIHRoZSBidWls
ZCBwcm9jZXNzIGZvciB0aGUgaG9zdC10b29sIGFuZCB0aGUgY29uZmlndXJlIGZpbGUgYW5kIG90
aGVyIHBpZWNlcyByZXF1aXJlIHRoZSBCTUMtc3R1ZmYgdG8gYmUgaW5zdGFsbGVkIGZpcnN0IChz
ZGJ1c3BsdXMsIGV0YykuICBJJ20gZ29pbmcgdG8gY2xlYW51cCB0aGUgY29uZmlndXJlIGZpbGUg
c28gdGhhdCBpZiB5b3UncmUgYnVpbGRpbmcgdGhlIGhvc3QtdG9vbCBpdCBkb2Vzbid0IHRyeSB0
byBidWlsZCB0aGUgQk1DIHN0dWZmLg0KDQoNCg0KUmVnYXJkcywNCkFuZHJldw0K

--_000_027a78e697414daaa44d775062fdb93elenovocom_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:=CB=CE=CC=E5;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:=B5=C8=CF=DF;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@PMingLiU";
	panose-1:2 1 6 1 0 1 1 1 1 1;}
@font-face
	{font-family:"\@=CB=CE=CC=E5";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@=B5=C8=CF=DF";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:=CB=CE=CC=E5;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
code
	{mso-style-priority:99;
	font-family:=CB=CE=CC=E5;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:=CB=CE=CC=E5;}
p.gmail-m-6091798217660211465gmail-m-7106965077525685122msolistparagraph, l=
i.gmail-m-6091798217660211465gmail-m-7106965077525685122msolistparagraph, d=
iv.gmail-m-6091798217660211465gmail-m-7106965077525685122msolistparagraph
	{mso-style-name:gmail-m_-6091798217660211465gmail-m_-7106965077525685122ms=
olistparagraph;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:=CB=CE=CC=E5;}
span.EmailStyle20
	{mso-style-type:personal;
	font-family:=B5=C8=CF=DF;
	color:#1F497D;}
span.EmailStyle21
	{mso-style-type:personal-compose;
	font-family:=B5=C8=CF=DF;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	font-family:=B5=C8=CF=DF;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:black;mso-fareast-language:ZH-TW">Hi Patrick,<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:black;mso-fareast-language:ZH-TW"><br>
I synchronized our Openbmc </span><span lang=3D"EN-US" style=3D"font-family=
:&quot;Calibri&quot;,sans-serif;color:black;background:white">repository&nb=
sp;</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,san=
s-serif;color:black;mso-fareast-language:ZH-TW">with
</span><em><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sa=
ns-serif;color:black;background:white;font-style:normal">upstream</span></e=
m><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;=
color:black;background:white">&nbsp;repository&nbsp;then compiled and
 checked the result yesterday, we can generate </span><em><span lang=3D"EN-=
US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black;backgro=
und:white;font-style:normal">dynamically linked binary but still failed to =
generate statically linked binary.&nbsp;
</span></em><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,s=
ans-serif;mso-fareast-language:ZH-TW">I used
<em><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black;b=
ackground:white;font-style:normal">OpenBmc
</span></em></span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&=
quot;,sans-serif">environment</span><span lang=3D"EN-US" style=3D"font-fami=
ly:&quot;Calibri&quot;,sans-serif;mso-fareast-language:ZH-TW"> to compile a=
nd also created a SDK
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">environment by using x86-64 toolchain (oecore-x86_64-core2-64-toolcha=
in-nodistro.0.sh) to compile, the compile result is the same.
</span><em><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sa=
ns-serif;color:black;background:white;mso-fareast-language:ZH-TW;font-style=
:normal">It seems to the linker not find the
</span></em><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,s=
ans-serif;letter-spacing:-.05pt;background:white">archive file libpci.a,
</span><em><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sa=
ns-serif;color:black;background:white;font-style:normal">could you take a l=
ook my problem? Thanks.</span></em><em><span lang=3D"EN-US" style=3D"font-f=
amily:=CB=CE=CC=E5;color:black;background:white;font-style:normal"><o:p></o=
:p></span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:&quot;=
Calibri&quot;,sans-serif;color:black;background:white;font-style:normal"><o=
:p>&nbsp;</o:p></span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:&quot;=
Calibri&quot;,sans-serif;color:black;background:white;mso-fareast-language:=
ZH-TW;font-style:normal">I will get error message when I run the tool in my=
 host platform as below. The</span></em><em><span lang=3D"EN-US" style=3D"f=
ont-family:&quot;Calibri&quot;,sans-serif;color:black;background:white;font=
-style:normal">
 dynamically linked binary</span></em><em><span lang=3D"EN-US" style=3D"fon=
t-family:&quot;Calibri&quot;,sans-serif;color:black;background:white;mso-fa=
reast-language:ZH-TW;font-style:normal"> is not convenience to use since I =
have to modify
</span></em><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,s=
ans-serif;color:#242729;background:white">rpath and interpreter&nbsp;of alr=
eady compiled ELF.
</span><em><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sa=
ns-serif;color:black;background:white;mso-fareast-language:ZH-TW;font-style=
:normal"><o:p></o:p></span></em></p>
<p class=3D"MsoNormal" style=3D"margin-left:12.0pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-seri=
f;color:black;background:silver;mso-highlight:silver">pengms1@hsbmc: $ ./bu=
rn_my_bmc
</span><span lang=3D"EN-US" style=3D"background:silver;mso-highlight:silver=
"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:12.0pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-seri=
f;color:black;background:silver;mso-highlight:silver">-bash: ./burn_my_bmc:=
 No such file or directory<br>
<br>
pengms1@hsbmc: $ ldd ./burn_my_bmc<br>
<em><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;font-style:no=
rmal">./burn_my_bmc: /lib/x86_64-linux-gnu/libpci.so.3: version `LIBPCI_3.5=
' not found (required by ./burn_my_bmc)</span></em></span><em><span lang=3D=
"EN-US" style=3D"font-family:=CB=CE=CC=E5;background:silver;mso-highlight:s=
ilver;font-style:normal"><o:p></o:p></span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:&quot;=
Calibri&quot;,sans-serif;color:black;background:silver;mso-highlight:silver=
;font-style:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; linux-vdso.so.1 =
=3D&gt;&nbsp; (0x00007ffcd2363000)<o:p></o:p></span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:&quot;=
Calibri&quot;,sans-serif;color:black;background:silver;mso-highlight:silver=
;font-style:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; libipmiblob.so.0 =
=3D&gt; /home/pengms1/SDK/OpenBmc/rootfs/lib/libipmiblob.so.0 (0x00007f25d3=
73a000)<o:p></o:p></span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:&quot;=
Calibri&quot;,sans-serif;color:black;background:silver;mso-highlight:silver=
;font-style:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; libpci.so.3 =3D&gt=
; /lib/x86_64-linux-gnu/libpci.so.3 (0x00007f25d3512000)<o:p></o:p></span><=
/em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:&quot;=
Calibri&quot;,sans-serif;color:black;background:silver;mso-highlight:silver=
;font-style:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; libstdc&#43;&#43;.=
so.6 =3D&gt; /usr/lib/x86_64-linux-gnu/libstdc&#43;&#43;.so.6 (0x00007f25d3=
190000)<o:p></o:p></span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:&quot;=
Calibri&quot;,sans-serif;color:black;background:silver;mso-highlight:silver=
;font-style:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; libgcc_s.so.1 =3D&=
gt; /lib/x86_64-linux-gnu/libgcc_s.so.1 (0x00007f25d2f79000)<o:p></o:p></sp=
an></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:&quot;=
Calibri&quot;,sans-serif;color:black;background:silver;mso-highlight:silver=
;font-style:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; libc.so.6 =3D&gt; =
/lib/x86_64-linux-gnu/libc.so.6 (0x00007f25d2baf000)<o:p></o:p></span></em>=
</p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:&quot;=
Calibri&quot;,sans-serif;color:black;background:silver;mso-highlight:silver=
;font-style:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; libm.so.6 =3D&gt; =
/lib/x86_64-linux-gnu/libm.so.6 (0x00007f25d28a6000)<o:p></o:p></span></em>=
</p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:&quot;=
Calibri&quot;,sans-serif;color:black;background:silver;mso-highlight:silver=
;font-style:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; libz.so.1 =3D&gt; =
/lib/x86_64-linux-gnu/libz.so.1 (0x00007f25d268b000)<o:p></o:p></span></em>=
</p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:&quot;=
Calibri&quot;,sans-serif;color:black;background:silver;mso-highlight:silver=
;font-style:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; libresolv.so.2 =3D=
&gt; /lib/x86_64-linux-gnu/libresolv.so.2 (0x00007f25d2470000)<o:p></o:p></=
span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:&quot;=
Calibri&quot;,sans-serif;color:black;background:silver;mso-highlight:silver=
;font-style:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; libudev.so.1 =3D&g=
t; /lib/x86_64-linux-gnu/libudev.so.1 (0x00007f25d2450000)<o:p></o:p></span=
></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:&quot;=
Calibri&quot;,sans-serif;color:black;background:silver;mso-highlight:silver=
;font-style:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /lib/ld-linux-x86-=
64.so.2 =3D&gt; /lib64/ld-linux-x86-64.so.2 (0x000055731193b000)<o:p></o:p>=
</span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:&quot;=
Calibri&quot;,sans-serif;color:black;background:silver;mso-highlight:silver=
;font-style:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; librt.so.1 =3D&gt;=
 /lib/x86_64-linux-gnu/librt.so.1 (0x00007f25d2247000)<o:p></o:p></span></e=
m></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:&quot;=
Calibri&quot;,sans-serif;color:black;background:silver;mso-highlight:silver=
;font-style:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; libpthread.so.0 =
=3D&gt; /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007f25d202a000)</span></=
em><em><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif;color:black;background:white;font-style:normal"><o:p></o:p></span></em=
></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:=CB=CE=
=CC=E5;color:black;background:white;font-style:normal"><o:p>&nbsp;</o:p></s=
pan></em></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-family:&quot;C=
alibri&quot;,sans-serif;mso-fareast-language:ZH-TW">The compile error messa=
ge is below:<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;mso-fareast-language:ZH-TW">x86_64-openbmc-linux-libto=
ol: link: x86_64-openbmc-linux-g&#43;&#43; -m64 -march=3Dcore2 -mtune=3Dcor=
e2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/pengms1/openbmc_trunk_x86/build/=
tmp/work/core2-64-openbmc-linux/phosphor-ipmi-flash/0.1&#43;gitAUTOINC&#43;=
7c79b252c1-r1/recipe-sysroot
 -std=3Dc&#43;&#43;17 -I../../git -O2 -pipe -g -feliminate-unused-debug-typ=
es -fmacro-prefix-map=3D/home/pengms1/openbmc_trunk_x86/build/tmp/work/core=
2-64-openbmc-linux/phosphor-ipmi-flash/0.1&#43;gitAUTOINC&#43;7c79b252c1-r1=
=3D/usr/src/debug/phosphor-ipmi-flash/0.1&#43;gitAUTOINC&#43;7c79b252c1-r1
 -fdebug-prefix-map=3D/home/pengms1/openbmc_trunk_x86/build/tmp/work/core2-=
64-openbmc-linux/phosphor-ipmi-flash/0.1&#43;gitAUTOINC&#43;7c79b252c1-r1=
=3D/usr/src/debug/phosphor-ipmi-flash/0.1&#43;gitAUTOINC&#43;7c79b252c1-r1 =
-fdebug-prefix-map=3D/home/pengms1/openbmc_trunk_x86/build/tmp/work/core2-6=
4-openbmc-linux/phosphor-ipmi-flash/0.1&#43;gitAUTOINC&#43;7c79b252c1-r1/re=
cipe-sysroot=3D
 -fdebug-prefix-map=3D/home/pengms1/openbmc_trunk_x86/build/tmp/work/core2-=
64-openbmc-linux/phosphor-ipmi-flash/0.1&#43;gitAUTOINC&#43;7c79b252c1-r1/r=
ecipe-sysroot-native=3D -fvisibility-inlines-hidden -Wall -Werror -DENABLE_=
REBOOT_UPDATE -DENABLE_STATIC_LAYOUT -DENABLE_LPC_BRIDGE
 -DASPEED_LPC -static -o burn_my_bmc burn_my_bmc-main.o&nbsp; ./.libs/libup=
dater.a -lipmiblob -lpci<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;mso-fareast-language:ZH-TW">| /home/pengms1/openbmc_tr=
unk_x86/build/tmp/work/core2-64-openbmc-linux/phosphor-ipmi-flash/0.1&#43;g=
itAUTOINC&#43;7c79b252c1-r1/recipe-sysroot-native/usr/bin/x86_64-openbmc-li=
nux/../../libexec/x86_64-openbmc-linux/gcc/x86_64-openbmc-linux/9.1.0/ld:
<b><span style=3D"color:red">cannot find -lpci</span></b><o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:=CB=CE=
=CC=E5;color:black;background:white;font-style:normal"><o:p>&nbsp;</o:p></s=
pan></em></p>
<p class=3D"MsoNormal"><em><b><span lang=3D"EN-US" style=3D"font-family:&qu=
ot;Calibri&quot;,sans-serif;color:black;background:white;mso-fareast-langua=
ge:ZH-TW;font-style:normal">My OpenBmc build
</span></b></em><b><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&=
quot;,sans-serif">environment is below.</span><span lang=3D"EN-US"><o:p></o=
:p></span></b></p>
<table class=3D"MsoTableGrid" border=3D"1" cellspacing=3D"0" cellpadding=3D=
"0" style=3D"border-collapse:collapse;border:none">
<tbody>
<tr>
<td width=3D"251" valign=3D"top" style=3D"width:232.4pt;border:solid window=
text 1.0pt;background:yellow;padding:0cm 5.4pt 0cm 5.4pt">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;mso-fareast-language:ZH-TW">OpenBmc Setting<o:p></o:p>=
</span></p>
</td>
<td width=3D"310" valign=3D"top" style=3D"width:263.35pt;border:solid windo=
wtext 1.0pt;border-left:none;background:yellow;padding:0cm 5.4pt 0cm 5.4pt"=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif">phosphor-ipmi-flash setting (<span style=3D"color:red=
">build
<em><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;background:ye=
llow;font-style:normal">static binary</span></em></span>)<o:p></o:p></span>=
</p>
</td>
<td width=3D"146" valign=3D"top" style=3D"width:120.5pt;border:solid window=
text 1.0pt;border-left:none;background:yellow;padding:0cm 5.4pt 0cm 5.4pt">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;mso-fareast-language:ZH-TW">Extra setting
<o:p></o:p></span></p>
</td>
</tr>
<tr style=3D"height:130.5pt">
<td width=3D"251" rowspan=3D"3" valign=3D"top" style=3D"width:232.4pt;borde=
r:solid windowtext 1.0pt;border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height=
:130.5pt">
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:&quot;=
Calibri&quot;,sans-serif;color:black;background:white;mso-fareast-language:=
ZH-TW;font-style:normal">Build Configuration:</span></em><em><span lang=3D"=
EN-US" style=3D"font-family:=CB=CE=CC=E5;color:black;background:white;font-=
style:normal"><o:p></o:p></span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:&quot;=
Calibri&quot;,sans-serif;color:black;background:white;mso-fareast-language:=
ZH-TW;font-style:normal">BB_VERSION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; =3D &quot;1.43.0&quot;<o:p></o:p></span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:&quot;=
Calibri&quot;,sans-serif;color:black;background:white;mso-fareast-language:=
ZH-TW;font-style:normal">BUILD_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;x86_64-linux&quot;<o:p></o:p></span></e=
m></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:&quot;=
Calibri&quot;,sans-serif;color:black;background:white;mso-fareast-language:=
ZH-TW;font-style:normal">NATIVELSBSTRING&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D =
&quot;ubuntu-16.04&quot;<o:p></o:p></span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:&quot;=
Calibri&quot;,sans-serif;color:black;background:white;mso-fareast-language:=
ZH-TW;font-style:normal">TARGET_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; =3D &quot;x86_64-openbmc-linux&quot;<o:p></o:p></span>=
</em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:&quot;=
Calibri&quot;,sans-serif;color:black;background:white;mso-fareast-language:=
ZH-TW;font-style:normal">MACHINE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;qemux86-64&quot;<o:p></o:p></=
span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:&quot;=
Calibri&quot;,sans-serif;color:black;background:white;mso-fareast-language:=
ZH-TW;font-style:normal">DISTRO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;openbmc-phosphor&quot;<o=
:p></o:p></span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:&quot;=
Calibri&quot;,sans-serif;color:black;background:white;mso-fareast-language:=
ZH-TW;font-style:normal">DISTRO_VERSION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 =3D &quot;0.1.2&quot;<o:p></o:p></span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:&quot;=
Calibri&quot;,sans-serif;color:black;background:white;mso-fareast-language:=
ZH-TW;font-style:normal">TUNE_FEATURES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; =3D &quot;m64 core2&quot;<o:p></o:p></span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:&quot;=
Calibri&quot;,sans-serif;color:black;background:white;mso-fareast-language:=
ZH-TW;font-style:normal">TARGET_FPU&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; =3D &quot;&quot;</span></em><span lang=3D"EN-US"><o:p>=
</o:p></span></p>
</td>
<td width=3D"310" valign=3D"top" style=3D"width:263.35pt;border-top:none;bo=
rder-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid wind=
owtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:130.5pt">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif">EXTRA_OECONF &#43;=3D &quot; --enable-build-host-tool=
 --enable-static-layout --enable-lpc-bridge
<br>
--enable-aspeed-lpc MAPPED_ADDRESS=3D0x98000000 --enable-reboot-update &quo=
t;<br>
<br>
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif">EXTRA_OEMAKE &#43;=3D &quot; LDFLAGS=3D-all-static &q=
uot;
<span style=3D"color:red">(Build a <em><span style=3D"font-family:&quot;Cal=
ibri&quot;,sans-serif;background:white;font-style:normal">statically linked=
 binary</span></em>)</span><o:p></o:p></span></p>
</td>
<td width=3D"146" rowspan=3D"3" valign=3D"top" style=3D"width:120.5pt;borde=
r-top:none;border-left:none;border-bottom:solid windowtext 1.0pt;border-rig=
ht:solid windowtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:130.5pt">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif">DISABLE_STATIC =3D &quot;&quot;&nbsp; (<span style=3D=
"color:red">Build
<em><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;background:wh=
ite;font-style:normal">statically library for
</span></em>ipmi-blob-tool)</span><o:p></o:p></span></p>
</td>
</tr>
<tr style=3D"height:23.25pt">
<td width=3D"310" valign=3D"top" style=3D"width:263.35pt;border-top:none;bo=
rder-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid wind=
owtext 1.0pt;background:yellow;padding:0cm 5.4pt 0cm 5.4pt;height:23.25pt">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif">phosphor-ipmi-flash setting (<span style=3D"color:red=
">build
<em><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;background:ye=
llow;font-style:normal">dynamic binary</span></em></span>)<o:p></o:p></span=
></p>
</td>
</tr>
<tr style=3D"height:79.75pt">
<td width=3D"310" valign=3D"top" style=3D"width:263.35pt;border-top:none;bo=
rder-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid wind=
owtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:79.75pt">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif">EXTRA_OECONF &#43;=3D &quot; --enable-build-host-tool=
 --enable-static-layout --enable-lpc-bridge
<br>
--enable-aspeed-lpc MAPPED_ADDRESS=3D0x98000000 --enable-reboot-update &quo=
t;<o:p></o:p></span></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:black;mso-fareast-language:ZH-TW">Regards,<br>
Andrew<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:=B5=
=C8=CF=DF">=B7=A2=BC=FE=C8=CB<span lang=3D"EN-US">:</span></span></b><span =
lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:=B5=C8=CF=DF"> Patrick=
 Venture &lt;venture@google.com&gt;
<br>
</span><b><span style=3D"font-size:11.0pt;font-family:=B5=C8=CF=DF">=B7=A2=
=CB=CD=CA=B1=BC=E4<span lang=3D"EN-US">:</span></span></b><span lang=3D"EN-=
US" style=3D"font-size:11.0pt;font-family:=B5=C8=CF=DF"> 2019</span><span s=
tyle=3D"font-size:11.0pt;font-family:=B5=C8=CF=DF">=C4=EA<span lang=3D"EN-U=
S">6</span>=D4=C2<span lang=3D"EN-US">27</span>=C8=D5<span lang=3D"EN-US">
 9:59<br>
</span><b>=CA=D5=BC=FE=C8=CB<span lang=3D"EN-US">:</span></b><span lang=3D"=
EN-US"> Andrew MS1 Peng &lt;pengms1@lenovo.com&gt;; OpenBMC Maillist &lt;op=
enbmc@lists.ozlabs.org&gt;<br>
</span><b>=B3=AD=CB=CD<span lang=3D"EN-US">:</span></b><span lang=3D"EN-US"=
> Duke KH Du &lt;dukh@lenovo.com&gt;; benjaminfair@google.com; Adriana Koby=
lak &lt;anoo@us.ibm.com&gt;<br>
</span><b>=D6=F7=CC=E2<span lang=3D"EN-US">:</span></b><span lang=3D"EN-US"=
> [External] Re: Clarify some questions about in-band firmware update<o:p><=
/o:p></span></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On Wed, Jun 26, 2019 at 7:44 AM=
 Patrick Venture &lt;<a href=3D"mailto:venture@google.com">venture@google.c=
om</a>&gt; wrote:<o:p></o:p></span></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0cm;margin-=
bottom:5.0pt">
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On Wed, Jun 26, 2019 at 4:28 AM=
 Andrew MS1 Peng &lt;<a href=3D"mailto:pengms1@lenovo.com" target=3D"_blank=
">pengms1@lenovo.com</a>&gt; wrote:<o:p></o:p></span></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0cm;margin-=
bottom:5.0pt">
<div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans=
-serif">Hi Patrick,</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans=
-serif">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans=
-serif;color:black">I have some questions as below, could you help to clari=
fy. Thanks.</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"gmail-m-6091798217660211465gmail-m-7106965077525685122msolistpa=
ragraph" style=3D"margin-left:18.0pt">
<span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;co=
lor:black">1.</span><span lang=3D"EN-US" style=3D"font-size:7.0pt;font-fami=
ly:&quot;Times New Roman&quot;,serif;color:black">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif;color:black">Do you have any plans to support BIOS update in phosphor-=
ipmi-flash?</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"gmail-m-6091798217660211465gmail-m-7106965077525685122msolistpa=
ragraph" style=3D"margin-left:18.0pt">
<span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;co=
lor:black">If the answer is no, we would like to help to add this feature. =
Could you give us some advice or clues to implement it.</span><span lang=3D=
"EN-US"><o:p></o:p></span></p>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">This could be added to the desi=
gn (first step).<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I could probably roll out this =
in a day or two, it's not a difficult extension with a few caveats. We'd ha=
ve to define new services, such as update_bios.service instead&nbsp;of upda=
te_bmc.service.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I have some cycles, so I don't =
mind reviewing the changes required and rolling something out --&nbsp;<o:p>=
</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0cm;margin-=
bottom:5.0pt">
<div>
<div>
<p class=3D"gmail-m-6091798217660211465gmail-m-7106965077525685122msolistpa=
ragraph" style=3D"margin-left:18.0pt">
<span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;co=
lor:black">2.</span><span lang=3D"EN-US" style=3D"font-size:7.0pt;font-fami=
ly:&quot;Times New Roman&quot;,serif;color:black">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif;color:black">The FPGA rom image is embedded in BMC image, we would lik=
e to add fpga-update.service and fpga-verify.service in phosphor-ipmi-flash=
, we expect that run both services after update
 BMC image completely. Do you have any concerns about it?</span><span lang=
=3D"EN-US"><o:p></o:p></span></p>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">There are a couple things to un=
pack here.&nbsp; The FPGA rom is embedded in the BMC image.&nbsp; How is th=
e BMC updated?&nbsp; I ask because a machine can (and is expected to) provi=
de its own update_bmc.service implementation.&nbsp; This
 service could trigger the fpga-verify and fpga-update services within what=
ever code is called from the update_bmc service you specify.<o:p></o:p></sp=
an></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0cm;margin-=
bottom:5.0pt">
<div>
<div>
<p class=3D"gmail-m-6091798217660211465gmail-m-7106965077525685122msolistpa=
ragraph" style=3D"margin-left:18.0pt">
<span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;co=
lor:black">3.</span><span lang=3D"EN-US" style=3D"font-size:7.0pt;font-fami=
ly:&quot;Times New Roman&quot;,serif;color:black">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif;color:black">How can I make a static executable host tool (burn_my_bmc=
)? Currently, I can=A1=AFt to make a
<em><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;background:wh=
ite;font-style:normal">statically linked binary successfully</span></em>, b=
ut I have made it before you added p2a function.</span><span lang=3D"EN-US"=
><o:p></o:p></span></p>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">For the host tool you need to s=
pecify very little, you should be able to build it via:<o:p></o:p></span></=
p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">./bootstrap.sh<o:p></o:p></span=
></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">./configure<o:p></o:p></span></=
p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">./make<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">You will need to checkout and i=
nstall ipmi-blob-tool first (openbmc/ipmi-blob-tool)<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">^^ --- those steps should go on=
 the README.&nbsp; Will add them shortly.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0cm;margin-=
bottom:5.0pt">
<div>
<div>
<p class=3D"gmail-m-6091798217660211465gmail-m-7106965077525685122msolistpa=
ragraph" style=3D"margin-left:18.0pt">
<span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;co=
lor:black">Based on different OS
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">environment as below,
<span style=3D"color:black">I would like to have a static executable since =
<em><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;background:wh=
ite;font-style:normal">dynamically linked binary can=A1=AFt work normally i=
n host OS.</span></em></span></span><span lang=3D"EN-US"><o:p></o:p></span>=
</p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" style=3D"margin-left:18.0pt;border-collapse:collapse">
<tbody>
<tr>
<td width=3D"288" valign=3D"top" style=3D"width:215.75pt;border:solid windo=
wtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt">
<p class=3D"gmail-m-6091798217660211465gmail-m-7106965077525685122msolistpa=
ragraph">
<span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif">H=
ost OS environment</span><span lang=3D"EN-US"><o:p></o:p></span></p>
</td>
<td width=3D"288" valign=3D"top" style=3D"width:215.75pt;border:solid windo=
wtext 1.0pt;border-left:none;padding:0cm 5.4pt 0cm 5.4pt">
<p class=3D"gmail-m-6091798217660211465gmail-m-7106965077525685122msolistpa=
ragraph">
<span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif">B=
uild environment (OpenBmc)</span><span lang=3D"EN-US"><o:p></o:p></span></p=
>
</td>
</tr>
<tr>
<td width=3D"288" valign=3D"top" style=3D"width:215.75pt;border:solid windo=
wtext 1.0pt;border-top:none;padding:0cm 5.4pt 0cm 5.4pt">
<p class=3D"gmail-m-6091798217660211465gmail-m-7106965077525685122msolistpa=
ragraph">
<span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif">G=
cc&nbsp; v4.8.5</span><span lang=3D"EN-US"><o:p></o:p></span></p>
</td>
<td width=3D"288" valign=3D"top" style=3D"width:215.75pt;border-top:none;bo=
rder-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid wind=
owtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt">
<p class=3D"gmail-m-6091798217660211465gmail-m-7106965077525685122msolistpa=
ragraph">
<span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif">G=
cc&nbsp;&nbsp; v8.3.0</span><span lang=3D"EN-US"><o:p></o:p></span></p>
</td>
</tr>
<tr>
<td width=3D"288" valign=3D"top" style=3D"width:215.75pt;border:solid windo=
wtext 1.0pt;border-top:none;padding:0cm 5.4pt 0cm 5.4pt">
<p class=3D"gmail-m-6091798217660211465gmail-m-7106965077525685122msolistpa=
ragraph">
<span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif">G=
libc&nbsp; v2.17</span><span lang=3D"EN-US"><o:p></o:p></span></p>
</td>
<td width=3D"288" valign=3D"top" style=3D"width:215.75pt;border-top:none;bo=
rder-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid wind=
owtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt">
<p class=3D"gmail-m-6091798217660211465gmail-m-7106965077525685122msolistpa=
ragraph">
<span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif">G=
libc&nbsp; v2.29</span><span lang=3D"EN-US"><o:p></o:p></span></p>
</td>
</tr>
</tbody>
</table>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The bitbake recipe isn't meant =
to be used for the host tool.&nbsp; It explicitly disables building the hos=
t-tool by default.&nbsp; You should be able to check out the repo and build=
 from there.&nbsp; Let me know if you run into issues
 with that.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0cm;margin-=
bottom:5.0pt">
<div>
<div>
<p class=3D"gmail-m-6091798217660211465gmail-m-7106965077525685122msolistpa=
ragraph" style=3D"margin-left:18.0pt">
<span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif">4=
.</span><span lang=3D"EN-US" style=3D"font-size:7.0pt;font-family:&quot;Tim=
es New Roman&quot;,serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif">I didn=A1=AFt find the below service files in source tree, where can =
find default services or should we provide our own services?
</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"gmail-m-6091798217660211465gmail-m-7106965077525685122msolistpa=
ragraph" style=3D"margin-left:18.0pt">
<code><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-se=
rif">update_bmc.service</span></code><span lang=3D"EN-US" style=3D"font-fam=
ily:&quot;Calibri&quot;,sans-serif"><br>
<code><span style=3D"font-family:&quot;Calibri&quot;,sans-serif">verify_ima=
ge.service</span></code><br>
<code><span style=3D"font-family:&quot;Calibri&quot;,sans-serif">prepare_up=
date.service</span></code></span><span lang=3D"EN-US"><o:p></o:p></span></p=
>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">That's correct.&nbsp; There are=
 currently no default service files.&nbsp; I am thinking of providing a def=
ault prepare_update service in a later CL, however updating the BMC or veri=
fying the image depend entirely on the system
 -- which makes it difficult to have a default.&nbsp; In point of fact, the=
re isn't really a valid default phosphor-ipmi-flash build for a BMC.&nbsp; =
Everything needs to be specified.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">^--- I can work on making the u=
bi bmc option available if the ubi distro feature is enabled, etc -- provid=
ing some defaults.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">^--- I have a plan to provide a=
 prepare_update.service once I finish testing Aspeed LPC support.<o:p></o:p=
></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
</div>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I've been reviewing the build p=
rocess for the host-tool and the configure file and other pieces require th=
e BMC-stuff to be installed first (sdbusplus, etc).&nbsp; I'm going to clea=
nup the configure file so that if you're
 building the host-tool it doesn't try to build the BMC stuff.&nbsp;<o:p></=
o:p></span></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0cm;margin-=
bottom:5.0pt">
<div>
<div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0cm;margin-=
bottom:5.0pt">
<div>
<div>
<p class=3D"gmail-m-6091798217660211465gmail-m-7106965077525685122msolistpa=
ragraph" style=3D"margin-left:18.0pt">
<span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans=
-serif">&nbsp;</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans=
-serif">Regards,<br>
Andrew</span><span lang=3D"EN-US"><o:p></o:p></span></p>
</div>
</div>
</blockquote>
</div>
</div>
</blockquote>
</div>
</div>
</div>
</body>
</html>

--_000_027a78e697414daaa44d775062fdb93elenovocom_--
