Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 786EF3309C5
	for <lists+openbmc@lfdr.de>; Mon,  8 Mar 2021 09:55:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvBxn3GGhz3cYX
	for <lists+openbmc@lfdr.de>; Mon,  8 Mar 2021 19:55:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=chunhui.jia@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvBxb457jz30LH
 for <openbmc@lists.ozlabs.org>; Mon,  8 Mar 2021 19:55:14 +1100 (AEDT)
IronPort-SDR: uep1I9L08+LMdyYQ+gTTAGE67Wpfi7ZYeoIFamoF3gVaP/ScZLUvkCa+zjdyHvEJsSTpHJrcuH
 G4OIx90GRwuA==
X-IronPort-AV: E=McAfee;i="6000,8403,9916"; a="187352734"
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
 d="scan'208,217";a="187352734"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2021 00:55:11 -0800
IronPort-SDR: f4IrYlN0cksKNnh350KdvUpidR8mROmuA6FuvgFz2VhtROeCNC+QeBOY8C11+qkN7+xPy/QlVK
 RgJ6tPC6Vmeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
 d="scan'208,217";a="409221540"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga008.jf.intel.com with ESMTP; 08 Mar 2021 00:55:11 -0800
Received: from shwdeopenbmc (shwdeopenbmc.ccr.corp.intel.com [10.239.164.28])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 3ED125808BA;
 Mon,  8 Mar 2021 00:55:10 -0800 (PST)
Date: Mon, 08 Mar 2021 16:55:11 +0800
From: "chunhui.jia" <chunhui.jia@linux.intel.com>
To: "Snowyang@linux.alibaba-inc.com" <SnowYang@linux.alibaba.com>,
 "Brad Bishop" <bradleyb@fuzziesquirrel.com>,
 "openbmc" <openbmc@lists.ozlabs.org>, "Patrick Williams" <patrick@stwcx.xyz>
Subject: Re:  Re:  why the command run failed?
In-Reply-To: <604590EF.2060409@linux.intel.com>
References: <f4211735-48ab-c0a1-ce41-cfb3cbb61a32@linux.alibaba.com>
 <604590EF.2060409@linux.intel.com>
X-Mailer: NetEase FlashMail 2.4.1.32
X-Priority: 3 (Normal)
MIME-Version: 1.0
Message-ID: <6045E66C.9030406@linux.intel.com>
Content-Type: multipart/alternative;
 boundary="NetEase-FlashMail-003-dfa7a908-0054-47f2-98a2-2f5b20a24477"
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

--NetEase-FlashMail-003-dfa7a908-0054-47f2-98a2-2f5b20a24477
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlcmUgaXMgbG9nIGluIHBhdGggbGlrZSA8cm9vdGRpcj4vYnVpbGQvdG1wL3dvcmsvYXJtdjdh
aGYtdmZwdjRkMTYtb3BlbmJtYy1saW51eC1nbnVlYWJpL3Bob3NwaG9yLWlwbWktaG9zdC8xLjAr
Z2l0QVVUT0lOQytkYTA2ZDE1Y2FiLXIxL3RlbXAuDQpZb3UgY291bGQgY2hlY2sgdGhhdCBmb3Ig
ZmFpbHVyZSBkZXRhaWxzLg0KDQoyMDIxLTAzLTA4IA0KDQpjaHVuaHVpLmppYSANCg0KDQoNCuWP
keS7tuS6uu+8miJTbm93eWFuZ0BsaW51eC5hbGliYWJhLWluYy5jb20iIDxTbm93WWFuZ0BsaW51
eC5hbGliYWJhLmNvbT4NCuWPkemAgeaXtumXtO+8mjIwMjEtMDMtMDMgMDk6NTINCuS4u+mimO+8
mndoeSB0aGUgY29tbWFuZCBydW4gZmFpbGVkPw0K5pS25Lu25Lq677yaIkJyYWQgQmlzaG9wIjxi
cmFkbGV5YkBmdXp6aWVzcXVpcnJlbC5jb20+LCJvcGVuYm1jIjxvcGVuYm1jQGxpc3RzLm96bGFi
cy5vcmc+LCJQYXRyaWNrIFdpbGxpYW1zIjxwYXRyaWNrQHN0d2N4Lnh5ej4NCuaKhOmAge+8mg0K
DQpIaSwgICAgDQogICAgd2hpbGUgaSB1c2UgY29tbWFuZCAiZGV2dG9vbCBtb2RpZnkgcGhvc3Bo
b3ItaXBtaS1ob3N0IiB0byBnZXQgdGhlIHNvdXJjZSBjb2RlLGl0ICByZXBvcnQgZXJyb3IgYXMg
YmVsb3cuIFNvIHdoeT8NClRoYW5rcw==

--NetEase-FlashMail-003-dfa7a908-0054-47f2-98a2-2f5b20a24477
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PCFET0NUWVBFIEhUTUwgUFVCTElDICItLy9XM0MvL0RURCBIVE1MIDQuMCBUcmFuc2l0aW9uYWwv
L0VOIj4NCjxIVE1MPjxIRUFEPg0KPE1FVEEgY29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0
Zi04IiBodHRwLWVxdWl2PUNvbnRlbnQtVHlwZT4NCjxNRVRBIG5hbWU9R0VORVJBVE9SIGNvbnRl
bnQ9Ik1TSFRNTCAxMS4wMC4xMDU3MC4xMDAxIj48IS0tIGZsYXNobWFpbCBzdHlsZSBiZWdpbiAt
LT4NCjxTVFlMRSB0eXBlPXRleHQvY3NzPgpib2R5IHtib3JkZXItd2lkdGg6MDttYXJnaW46MH0K
aW1nIHtib3JkZXI6MDttYXJnaW46MDtwYWRkaW5nOjB9CjwvU1RZTEU+DQo8QkFTRSB0YXJnZXQ9
X2JsYW5rPjwhLS0gZmxhc2htYWlsIHN0eWxlIGVuZCAtLT48L0hFQUQ+DQo8Qk9EWSANCnN0eWxl
PSJCT1JERVItTEVGVC1XSURUSDogMHB4OyBGT05ULVNJWkU6IDEwLjVwdDsgRk9OVC1GQU1JTFk6
IGFyaWFsOyBCT1JERVItUklHSFQtV0lEVEg6IDBweDsgQk9SREVSLUJPVFRPTS1XSURUSDogMHB4
OyBDT0xPUjogIzAwMDAwMDsgTUFSR0lOOiAxMnB4OyBMSU5FLUhFSUdIVDogMS41OyBCT1JERVIt
VE9QLVdJRFRIOiAwcHgiIA0KbWFyZ2luaGVpZ2h0PSIwIiBtYXJnaW53aWR0aD0iMCI+DQo8RElW
PlRoZXJlIGlzIGxvZyBpbiBwYXRoIGxpa2UgDQombHQ7cm9vdGRpciZndDsvYnVpbGQvdG1wL3dv
cmsvYXJtdjdhaGYtdmZwdjRkMTYtb3BlbmJtYy1saW51eC1nbnVlYWJpL3Bob3NwaG9yLWlwbWkt
aG9zdC8xLjArZ2l0QVVUT0lOQytkYTA2ZDE1Y2FiLXIxL3RlbXAuPC9ESVY+DQo8RElWPllvdSBj
b3VsZCBjaGVjayB0aGF0IGZvciBmYWlsdXJlIGRldGFpbHMuPC9ESVY+DQo8QkxPQ0tRVU9URSAN
CnN0eWxlPSJGT05ULVNJWkU6IDEwcHQ7IEZPTlQtRkFNSUxZOiBWZXJkYW5hOyBQQURESU5HLUxF
RlQ6IDBweDsgTUFSR0lOLUxFRlQ6IDBweCI+DQogIDxESVY+Jm5ic3A7PC9ESVY+DQogIDxESVYg
c3R5bGU9IkZPTlQtU0laRTogMTBwdDsgRk9OVC1GQU1JTFk6IFZlcmRhbmE7IENPTE9SOiAjYzBj
MGMwIiANCiAgYWxpZ249bGVmdD4yMDIxLTAzLTA4IA0KICA8SFIgaWQ9U2lnbk5hbWVIUiANCiAg
c3R5bGU9IkJPUkRFUi1UT1A6ICNjMGMwYzAgMXB4IHNvbGlkOyBIRUlHSFQ6IDFweDsgQk9SREVS
LVJJR0hUOiAwcHg7IFdJRFRIOiAxMjJweDsgQk9SREVSLUJPVFRPTTogMHB4OyBCT1JERVItTEVG
VDogMHB4IiANCiAgYWxpZ249bGVmdD4NCiAgPFNQQU4gaWQ9X0ZsYXNoU2lnbk5hbWU+Y2h1bmh1
aS5qaWE8L1NQQU4+IDwvRElWPg0KICA8RElWPg0KICA8SFIgDQogIHN0eWxlPSJCT1JERVItVE9Q
OiAjYzBjMGMwIDFweCBzb2xpZDsgSEVJR0hUOiAxcHg7IEJPUkRFUi1SSUdIVDogMHB4OyBCT1JE
RVItQk9UVE9NOiAwcHg7IEJPUkRFUi1MRUZUOiAwcHgiPg0KICA8L0RJVj4NCiAgPEJMT0NLUVVP
VEUgaWQ9bnRlcy1mbGFzaG1haWwtcXVvdGUgDQogIHN0eWxlPSJGT05ULVNJWkU6IDEwcHQ7IEZP
TlQtRkFNSUxZOiBWZXJkYW5hOyBQQURESU5HLUxFRlQ6IDBweDsgTUFSR0lOLUxFRlQ6IDBweCI+
DQogICAgPERJVj48U1RST05HPuWPkeS7tuS6uu+8mjwvU1RST05HPiJTbm93eWFuZ0BsaW51eC5h
bGliYWJhLWluYy5jb20iIA0KICAgICZsdDtTbm93WWFuZ0BsaW51eC5hbGliYWJhLmNvbSZndDs8
L0RJVj4NCiAgICA8RElWPjxTVFJPTkc+5Y+R6YCB5pe26Ze077yaPC9TVFJPTkc+MjAyMS0wMy0w
MyZuYnNwOzA5OjUyPC9ESVY+DQogICAgPERJVj48U1RST05HPuS4u+mimO+8mjwvU1RST05HPndo
eSB0aGUgY29tbWFuZCBydW4gZmFpbGVkPzwvRElWPg0KICAgIDxESVY+PFNUUk9ORz7mlLbku7bk
urrvvJo8L1NUUk9ORz4iQnJhZCANCiAgICBCaXNob3AiJmx0O2JyYWRsZXliQGZ1enppZXNxdWly
cmVsLmNvbSZndDssIm9wZW5ibWMiJmx0O29wZW5ibWNAbGlzdHMub3psYWJzLm9yZyZndDssIlBh
dHJpY2sgDQogICAgV2lsbGlhbXMiJmx0O3BhdHJpY2tAc3R3Y3gueHl6Jmd0OzwvRElWPg0KICAg
IDxESVY+PFNUUk9ORz7mioTpgIHvvJo8L1NUUk9ORz48L0RJVj4NCiAgICA8RElWPiZuYnNwOzwv
RElWPg0KICAgIDxESVY+DQogICAgPFA+SGksJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7PC9QPg0K
ICAgIDxQPiZuYnNwOyZuYnNwOyZuYnNwOyB3aGlsZSBpIHVzZSBjb21tYW5kICJkZXZ0b29sIG1v
ZGlmeSANCiAgICBwaG9zcGhvci1pcG1pLWhvc3QiIHRvIGdldCB0aGUgc291cmNlIGNvZGUsaXQm
bmJzcDsgcmVwb3J0IGVycm9yIGFzIGJlbG93LiANCiAgICBTbyB3aHk/PC9QPg0KICAgIDxQPlRo
YW5rczwvUD4NCiAgICA8UD4mbmJzcDs8L1A+DQogICAgPFA+PEJSPjwvUD48L0RJVj48L0JMT0NL
UVVPVEU+PC9CTE9DS1FVT1RFPjwvQk9EWT48L0hUTUw+

--NetEase-FlashMail-003-dfa7a908-0054-47f2-98a2-2f5b20a24477--

