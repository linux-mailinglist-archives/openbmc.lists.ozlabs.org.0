Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A23CC2C354B
	for <lists+openbmc@lfdr.de>; Wed, 25 Nov 2020 01:18:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CghLp57nyzDqTm
	for <lists+openbmc@lfdr.de>; Wed, 25 Nov 2020 11:18:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=he.huang@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgG1h3yKvzDqTh
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2020 18:32:04 +1100 (AEDT)
IronPort-SDR: qPvLFXbiBQGDKhQ8y5ZQzlQMOfgaHpfQ4aUmM1PR0TQa4dK+ahZYgIP9YSMb38nA9OLK4OmzS9
 xy4ztA6jLrtw==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="171122913"
X-IronPort-AV: E=Sophos;i="5.78,365,1599548400"; 
 d="scan'208,217";a="171122913"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 23:32:00 -0800
IronPort-SDR: onlKss62dxi6/1VWTS+cmaonPKiItifeMGiO5FwIxpERva3ns3VZMwVBo5OCBQQRfJPmxs5Gyo
 iZpuxxvn6k1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,365,1599548400"; 
 d="scan'208,217";a="364925703"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga002.fm.intel.com with ESMTP; 23 Nov 2020 23:32:00 -0800
Received: from huanghe-mobl (huanghe-mobl.ccr.corp.intel.com [10.239.16.21])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id DF70F580867;
 Mon, 23 Nov 2020 23:31:58 -0800 (PST)
Date: Tue, 24 Nov 2020 15:31:59 +0800
From: "he.huang" <he.huang@linux.intel.com>
To: "ed" <ed@tanous.net>, "jae.hyun.yoo" <jae.hyun.yoo@linux.intel.com>,
 "vernon.mauery" <vernon.mauery@linux.intel.com>,
 "openbmc" <openbmc@lists.ozlabs.org>
Subject: Add size property of EEPROM device
X-Mailer: NetEase FlashMail 2.4.1.32
X-Priority: 3 (Normal)
MIME-Version: 1.0
Message-ID: <5FBCB6EB.3080609@linux.intel.com>
Content-Type: multipart/alternative;
 boundary="NetEase-FlashMail-003-18ece246-6822-4817-86a2-48961b7dbd5c"
X-Mailman-Approved-At: Wed, 25 Nov 2020 11:17:46 +1100
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

--NetEase-FlashMail-003-18ece246-6822-4817-86a2-48961b7dbd5c
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQWxsLA0KSSdtIGdvaW5nIHRvIGFkZCB0aGUgInNpemUiIHByb3BlcnR5IHRvIHRoZSBmcnUg
ZGV2aWNlIC5qc29uIGZpbGUgdW5kZXIgZW50aXR5LW1hbmFnZXIvY29uZmlndXJhdGlvbnMuDQoN
ClRoZSByZXF1aXJlbWVudCBjb21lcyBmcm9tOg0KV2hlbiB3ZSB3cml0ZSB0byB0aGUgRUVQUk9N
IHdlIG5lZWQgdGhlIHNpemUgdG8gZW5zdXJlIHRoYXQgd2Ugd29uJ3Qgd3JpdGUgb3V0IG9mIHRo
ZSByYW5nZSBhbmQgcmV0dXJuIHRoZSBjb3JyZWN0IGNvbXBsZXRlIGNvZGUuDQoNCkhlcmUgaXMg
YW4gZXhhbXBsZSBmb3IgcmV2aWV3Og0KaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5
ei9jL29wZW5ibWMvZW50aXR5LW1hbmFnZXIvKy8zODUzMg0KDQpJZiB0aGUgcHJvcG9zYWwgZ2V0
cyBhcHByb3ZlZCBJIHdpbGwgYWRkIHRoZSAnc2l6ZScgcHJvcGVydHkgdG8gdGhlIG90aGVyIC5q
c29uIGZpbGUgdW5kZXIgZW50aXR5LW1hbmFnZXIvY29uZmlndXJhdGlvbnMuDQoNCkNvdWxkIHlv
dSBwbGVhc2UgaGVscCB0byByZXZpZXcgYW5kIGxldCBtZSBrbm93IGlmIHlvdSBoYXZlIGFueSBj
b21tZW50cy4NClRoYW5rcyBhIGxvdC4NCg0KMjAyMC0xMS0yNA0KDQoNCkhlbGVuLmh1YW5nIA==

--NetEase-FlashMail-003-18ece246-6822-4817-86a2-48961b7dbd5c
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PCFET0NUWVBFIEhUTUwgUFVCTElDICItLy9XM0MvL0RURCBIVE1MIDQuMCBUcmFuc2l0aW9uYWwv
L0VOIj4NCjxIVE1MPjxIRUFEPg0KPE1FVEEgY29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0
Zi04IiBodHRwLWVxdWl2PUNvbnRlbnQtVHlwZT4NCjxTVFlMRSB0eXBlPXRleHQvY3NzPgpCTE9D
S1FVT1RFe21hcmdpbi1Ub3A6IDBweDsgbWFyZ2luLUJvdHRvbTogMHB4OyBtYXJnaW4tTGVmdDog
MmVtfQ0KPC9TVFlMRT4NCjwhLS0gZmxhc2htYWlsIHN0eWxlIGJlZ2luIC0tPg0KPFNUWUxFIHR5
cGU9dGV4dC9jc3M+CmJvZHkge2JvcmRlci13aWR0aDowO21hcmdpbjowfQppbWcge2JvcmRlcjow
O21hcmdpbjowO3BhZGRpbmc6MH0KPC9TVFlMRT4NCjxCQVNFIHRhcmdldD1fYmxhbms+PCEtLSBm
bGFzaG1haWwgc3R5bGUgZW5kIC0tPg0KPE1FVEEgbmFtZT1HRU5FUkFUT1IgY29udGVudD0iTVNI
VE1MIDExLjAwLjEwNTcwLjEwMDEiPjwvSEVBRD4NCjxCT0RZIA0Kc3R5bGU9IkJPUkRFUi1MRUZU
LVdJRFRIOiAwcHg7IEZPTlQtU0laRTogMTAuNXB0OyBGT05ULUZBTUlMWTog77+977+977+977+9
77+977+977+977+977+977+977+977+977+977+977+977+9OyBCT1JERVItUklHSFQtV0lEVEg6
IDBweDsgQk9SREVSLUJPVFRPTS1XSURUSDogMHB4OyBDT0xPUjogIzAwMDAwMDsgTUFSR0lOOiAx
MnB4OyBMSU5FLUhFSUdIVDogMS41OyBCT1JERVItVE9QLVdJRFRIOiAwcHgiIA0KbWFyZ2luaGVp
Z2h0PSIwIiBtYXJnaW53aWR0aD0iMCI+PFNUQVRJT05FUlk+DQo8RElWPkhpIEFsbCw8L0RJVj4N
CjxESVY+SSdtIGdvaW5nIHRvIGFkZCB0aGUgInNpemUiIHByb3BlcnR5IHRvIHRoZSBmcnUgZGV2
aWNlIC5qc29uIGZpbGUgdW5kZXIgDQplbnRpdHktbWFuYWdlci9jb25maWd1cmF0aW9ucy48L0RJ
Vj4NCjxESVY+Jm5ic3A7PC9ESVY+DQo8RElWPlRoZSZuYnNwO3JlcXVpcmVtZW50IGNvbWVzIGZy
b206PC9ESVY+DQo8RElWPldoZW4gd2Ugd3JpdGUgdG8gdGhlIEVFUFJPTSZuYnNwO3dlIG5lZWQg
dGhlIHNpemUgdG8gZW5zdXJlIA0KdGhhdCZuYnNwO3dlJm5ic3A7d29uJ3Qgd3JpdGUgb3V0IG9m
IHRoZSByYW5nZSBhbmQmbmJzcDtyZXR1cm4gdGhlIGNvcnJlY3QgDQpjb21wbGV0ZSBjb2RlLjwv
RElWPg0KPERJVj4mbmJzcDs8L0RJVj4NCjxESVY+SGVyZSBpcyBhbiBleGFtcGxlIGZvciByZXZp
ZXc6PC9ESVY+DQo8RElWPjxBIA0KaHJlZj0iaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0
Lnh5ei9jL29wZW5ibWMvZW50aXR5LW1hbmFnZXIvKy8zODUzMiI+aHR0cHM6Ly9nZXJyaXQub3Bl
bmJtYy1wcm9qZWN0Lnh5ei9jL29wZW5ibWMvZW50aXR5LW1hbmFnZXIvKy8zODUzMjwvQT48L0RJ
Vj4NCjxESVY+Jm5ic3A7PC9ESVY+DQo8RElWPklmIHRoZSBwcm9wb3NhbCBnZXRzIGFwcHJvdmVk
IEkgd2lsbCBhZGQgdGhlICdzaXplJyBwcm9wZXJ0eSB0byB0aGUgb3RoZXIgDQouanNvbiBmaWxl
IHVuZGVyIGVudGl0eS1tYW5hZ2VyL2NvbmZpZ3VyYXRpb25zLjwvRElWPg0KPERJVj4mbmJzcDs8
L0RJVj4NCjxESVY+Q291bGQgeW91IHBsZWFzZSBoZWxwIHRvIHJldmlldyBhbmQgbGV0IG1lIGtu
b3cgaWYgeW91IGhhdmUgYW55IA0KY29tbWVudHMuPC9ESVY+DQo8RElWPlRoYW5rcyBhIGxvdC48
L0RJVj4NCjxESVY+Jm5ic3A7PC9ESVY+DQo8RElWIHN0eWxlPSJGT05ULVNJWkU6IDEwcHQ7IEZP
TlQtRkFNSUxZOiBWZXJkYW5hOyBDT0xPUjogI2MwYzBjMCI+DQo8RElWIGFsaWduPWxlZnQ+MjAy
MC0xMS0yNDwvRElWPg0KPEhSIGlkPVNpZ25OYW1lSFIgDQpzdHlsZT0iQk9SREVSLVRPUDogI2Mw
YzBjMCAxcHggc29saWQ7IEhFSUdIVDogMXB4OyBCT1JERVItUklHSFQ6IDBweDsgV0lEVEg6IDEy
MnB4OyBCT1JERVItQk9UVE9NOiAwcHg7IEJPUkRFUi1MRUZUOiAwcHgiIA0KYWxpZ249bGVmdD4N
CjxTUEFOIGlkPV9GbGFzaFNpZ25OYW1lPkhlbGVuLmh1YW5nPC9TUEFOPiA8L0RJVj48L1NUQVRJ
T05FUlk+PC9CT0RZPjwvSFRNTD4=

--NetEase-FlashMail-003-18ece246-6822-4817-86a2-48961b7dbd5c--

