Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B58C51E5816
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 09:02:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XdtP26b4zDqXN
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 17:02:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XdsT4qVLzDqSp
 for <openbmc@lists.ozlabs.org>; Thu, 28 May 2020 17:01:31 +1000 (AEST)
IronPort-SDR: YFe+FyqJce/tZIDQNAz0+o9On4qDEiro3LsqKSGWRndoZsReENALa2dXEW0NDypl4YyLOn+E7R
 fIZ/vDj3zcAg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2020 00:01:28 -0700
IronPort-SDR: 3x/Q4nNtMYb7BAjNaY7ifXSLqgv7gaI1rO3bgexmvlR3hMOtZ3cztvea3TWYKN63Kw4gicg3bj
 NeBjGLpRjyxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,443,1583222400"; 
 d="scan'208,217";a="469015168"
Received: from psarafx-mobl.gar.corp.intel.com (HELO [10.252.69.146])
 ([10.252.69.146])
 by fmsmga005.fm.intel.com with ESMTP; 28 May 2020 00:01:26 -0700
Subject: Re: LDAP authentication is not working
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
References: <b242dd63-3fb2-6c16-bbd2-3797afb23a8e@linux.vnet.ibm.com>
 <9e6d226f-fb2a-4d1e-f68f-826d958e85ec@linux.intel.com>
Message-ID: <5e30dae1-591f-76ba-02f2-8896dec298a7@linux.intel.com>
Date: Thu, 28 May 2020 12:31:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <9e6d226f-fb2a-4d1e-f68f-826d958e85ec@linux.intel.com>
Content-Type: multipart/alternative;
 boundary="------------50E67CC96C0D167E8661238A"
Content-Language: en-US
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
--------------50E67CC96C0D167E8661238A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ratan,

submitted a proper fix for the same

https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/32883 (depends 
https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/32901). 
Please verify the same and let me know your comments.

Regards,

Richard

On 5/19/2020 8:51 PM, Thomaiyar, Richard Marian wrote:
> Agree. As for LDAP user we defined privilege related mapping only and 
> not group based authentication restriction. I think adding group based 
> authentication for ldap users immediately, is not good option, as it 
> must be done with agreement from everyone.
>
> Quick solution is to skip the pam_succeed_if check if it is local user 
> using pam_localuser module. i.e. using user_unknown condition to skip 
> the pam_succeed_if, we can skip the group check for ldap users, and 
> still continue for local users.
>
> Note: I am OK, if you want to revert the fix immediately, i can roll 
> out the fix this weekend after testing.
>
> Regards,
>
> Richard
>
>
> On 5/19/2020 3:35 PM, Ratan Gupta wrote:
>> in the LDAP server and put the ldap user under the newly created 
>> "redfish" group
>> but that didn't help as same group is listed in both places(Local,LDAP)
>>
>> As I explained above local database will get priortize over LDAP
>>
>> Hence there would be failure. Now we have following option
>>
>> Priortize LDAP over Local if LDAP is enabled but in that case the 
>> same problem will occur for the local user.
>>
>> We have upstream tagging is planned for this week and with the commit 
>> below LDAP is broken
>>
>> (https://github.com/openbmc/bmcweb/commit/cd17b26c893ba9dd1dcb0d56d725f2892c57e125.) 
>>
>>
>> Should we revert it or do you have any plans?
>>
>> Please let me know your thoughts. 

--------------50E67CC96C0D167E8661238A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGh0bWw+DQogIDxoZWFkPg0KICAgIDxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PVVURi04Ij4NCiAgPC9oZWFkPg0KICA8Ym9k
eT4NCiAgICA8cD5IaSBSYXRhbiwgPGJyPg0KICAgIDwvcD4NCiAgICA8cD5zdWJtaXR0ZWQg
YSBwcm9wZXIgZml4IGZvciB0aGUgc2FtZSA8YnI+DQogICAgPC9wPg0KICAgIDxwPjxhDQog
ICAgICAgIGhyZWY9Imh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJvamVjdC54eXovYy9vcGVu
Ym1jL2JtY3dlYi8rLzMyODgzIj5odHRwczovL2dlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6
L2Mvb3BlbmJtYy9ibWN3ZWIvKy8zMjg4MzwvYT4NCiAgICAgIChkZXBlbmRzIDxhIGhyZWY9
Imh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJvamVjdC54eXovYy9vcGVuYm1jL21ldGEtcGhv
c3Bob3IvKy8zMjkwMSIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9vcGVuZXIiIGNsYXNzPSJz
dHlsZS1zY29wZSBnci1saW5rZWQtdGV4dCIgc3R5bGU9ImJveC1zaXppbmc6IGJvcmRlci1i
b3g7IG1hcmdpbjogMHB4OyBwYWRkaW5nOiAwcHg7IGJvcmRlcjogMHB4OyBmb250LXN0eWxl
OiBub3JtYWw7IGZvbnQtdmFyaWFudC1saWdhdHVyZXM6IG5vcm1hbDsgZm9udC12YXJpYW50
LWNhcHM6IG5vcm1hbDsgZm9udC12YXJpYW50LW51bWVyaWM6IGluaGVyaXQ7IGZvbnQtdmFy
aWFudC1lYXN0LWFzaWFuOiBpbmhlcml0OyBmb250LXdlaWdodDogNDAwOyBmb250LXN0cmV0
Y2g6IGluaGVyaXQ7IGZvbnQtc2l6ZTogMTNweDsgbGluZS1oZWlnaHQ6IGluaGVyaXQ7IGZv
bnQtZmFtaWx5OiBSb2JvdG8sIC1hcHBsZS1zeXN0ZW0sIEJsaW5rTWFjU3lzdGVtRm9udCwg
JnF1b3Q7U2Vnb2UgVUkmcXVvdDssIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWYsICZx
dW90O0FwcGxlIENvbG9yIEVtb2ppJnF1b3Q7LCAmcXVvdDtTZWdvZSBVSSBFbW9qaSZxdW90
OywgJnF1b3Q7U2Vnb2UgVUkgU3ltYm9sJnF1b3Q7OyB2ZXJ0aWNhbC1hbGlnbjogYmFzZWxp
bmU7IGNvbG9yOiByZ2IoNDIsIDEwMiwgMjE3KTsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsg
b3JwaGFuczogMjsgdGV4dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5kZW50OiAwcHg7IHRleHQt
dHJhbnNmb3JtOiBub25lOyB3aGl0ZS1zcGFjZTogcHJlLXdyYXA7IHdpZG93czogMjsgd29y
ZC1zcGFjaW5nOiAwcHg7IC13ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6IDBweDsgYmFja2dy
b3VuZC1jb2xvcjogcmdiKDI1NSwgMjU1LCAyNTUpOyI+aHR0cHM6Ly9nZXJyaXQub3BlbmJt
Yy1wcm9qZWN0Lnh5ei9jL29wZW5ibWMvbWV0YS1waG9zcGhvci8rLzMyOTAxPC9hPikuDQog
ICAgICBQbGVhc2UgdmVyaWZ5IHRoZSBzYW1lIGFuZCBsZXQgbWUga25vdyB5b3VyIGNvbW1l
bnRzLiA8YnI+DQogICAgPC9wPg0KICAgIDxwPlJlZ2FyZHMsPC9wPg0KICAgIDxwPlJpY2hh
cmQ8YnI+DQogICAgPC9wPg0KICAgIDxkaXYgY2xhc3M9Im1vei1jaXRlLXByZWZpeCI+T24g
NS8xOS8yMDIwIDg6NTEgUE0sIFRob21haXlhciwNCiAgICAgIFJpY2hhcmQgTWFyaWFuIHdy
b3RlOjxicj4NCiAgICA8L2Rpdj4NCiAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIg0KICAg
ICAgY2l0ZT0ibWlkOjllNmQyMjZmLWZiMmEtNGQxZS1mNjhmLTgyNmQ5NThlODVlY0BsaW51
eC5pbnRlbC5jb20iPkFncmVlLg0KICAgICAgQXMgZm9yIExEQVAgdXNlciB3ZSBkZWZpbmVk
IHByaXZpbGVnZSByZWxhdGVkIG1hcHBpbmcgb25seSBhbmQgbm90DQogICAgICBncm91cCBi
YXNlZCBhdXRoZW50aWNhdGlvbiByZXN0cmljdGlvbi4gSSB0aGluayBhZGRpbmcgZ3JvdXAg
YmFzZWQNCiAgICAgIGF1dGhlbnRpY2F0aW9uIGZvciBsZGFwIHVzZXJzIGltbWVkaWF0ZWx5
LCBpcyBub3QgZ29vZCBvcHRpb24sIGFzDQogICAgICBpdCBtdXN0IGJlIGRvbmUgd2l0aCBh
Z3JlZW1lbnQgZnJvbSBldmVyeW9uZS4NCiAgICAgIDxicj4NCiAgICAgIDxicj4NCiAgICAg
IFF1aWNrIHNvbHV0aW9uIGlzIHRvIHNraXAgdGhlIHBhbV9zdWNjZWVkX2lmIGNoZWNrIGlm
IGl0IGlzIGxvY2FsDQogICAgICB1c2VyIHVzaW5nIHBhbV9sb2NhbHVzZXIgbW9kdWxlLiBp
LmUuIHVzaW5nIHVzZXJfdW5rbm93biBjb25kaXRpb24NCiAgICAgIHRvIHNraXAgdGhlIHBh
bV9zdWNjZWVkX2lmLCB3ZSBjYW4gc2tpcCB0aGUgZ3JvdXAgY2hlY2sgZm9yIGxkYXANCiAg
ICAgIHVzZXJzLCBhbmQgc3RpbGwgY29udGludWUgZm9yIGxvY2FsIHVzZXJzLg0KICAgICAg
PGJyPg0KICAgICAgPGJyPg0KICAgICAgTm90ZTogSSBhbSBPSywgaWYgeW91IHdhbnQgdG8g
cmV2ZXJ0IHRoZSBmaXggaW1tZWRpYXRlbHksIGkgY2FuDQogICAgICByb2xsIG91dCB0aGUg
Zml4IHRoaXMgd2Vla2VuZCBhZnRlciB0ZXN0aW5nLg0KICAgICAgPGJyPg0KICAgICAgPGJy
Pg0KICAgICAgUmVnYXJkcywNCiAgICAgIDxicj4NCiAgICAgIDxicj4NCiAgICAgIFJpY2hh
cmQNCiAgICAgIDxicj4NCiAgICAgIDxicj4NCiAgICAgIDxicj4NCiAgICAgIE9uIDUvMTkv
MjAyMCAzOjM1IFBNLCBSYXRhbiBHdXB0YSB3cm90ZToNCiAgICAgIDxicj4NCiAgICAgIDxi
bG9ja3F1b3RlIHR5cGU9ImNpdGUiPmluIHRoZSBMREFQIHNlcnZlciBhbmQgcHV0IHRoZSBs
ZGFwIHVzZXINCiAgICAgICAgdW5kZXIgdGhlIG5ld2x5IGNyZWF0ZWQgInJlZGZpc2giIGdy
b3VwDQogICAgICAgIDxicj4NCiAgICAgICAgYnV0IHRoYXQgZGlkbid0IGhlbHAgYXMgc2Ft
ZSBncm91cCBpcyBsaXN0ZWQgaW4gYm90aA0KICAgICAgICBwbGFjZXMoTG9jYWwsTERBUCkN
CiAgICAgICAgPGJyPg0KICAgICAgICA8YnI+DQogICAgICAgIEFzIEkgZXhwbGFpbmVkIGFi
b3ZlIGxvY2FsIGRhdGFiYXNlIHdpbGwgZ2V0IHByaW9ydGl6ZSBvdmVyIExEQVANCiAgICAg
ICAgPGJyPg0KICAgICAgICA8YnI+DQogICAgICAgIEhlbmNlIHRoZXJlIHdvdWxkIGJlIGZh
aWx1cmUuIE5vdyB3ZSBoYXZlIGZvbGxvd2luZyBvcHRpb24NCiAgICAgICAgPGJyPg0KICAg
ICAgICA8YnI+DQogICAgICAgIFByaW9ydGl6ZSBMREFQIG92ZXIgTG9jYWwgaWYgTERBUCBp
cyBlbmFibGVkIGJ1dCBpbiB0aGF0IGNhc2UNCiAgICAgICAgdGhlIHNhbWUgcHJvYmxlbSB3
aWxsIG9jY3VyIGZvciB0aGUgbG9jYWwgdXNlci4NCiAgICAgICAgPGJyPg0KICAgICAgICA8
YnI+DQogICAgICAgIFdlIGhhdmUgdXBzdHJlYW0gdGFnZ2luZyBpcyBwbGFubmVkIGZvciB0
aGlzIHdlZWsgYW5kIHdpdGggdGhlDQogICAgICAgIGNvbW1pdCBiZWxvdyBMREFQIGlzIGJy
b2tlbg0KICAgICAgICA8YnI+DQogICAgICAgIDxicj4NCig8YSBjbGFzcz0ibW96LXR4dC1s
aW5rLWZyZWV0ZXh0IiBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9ibWN3ZWIv
Y29tbWl0L2NkMTdiMjZjODkzYmE5ZGQxZGNiMGQ1NmQ3MjVmMjg5MmM1N2UxMjUiPmh0dHBz
Oi8vZ2l0aHViLmNvbS9vcGVuYm1jL2JtY3dlYi9jb21taXQvY2QxN2IyNmM4OTNiYTlkZDFk
Y2IwZDU2ZDcyNWYyODkyYzU3ZTEyNTwvYT4uKQ0KICAgICAgICA8YnI+DQogICAgICAgIDxi
cj4NCiAgICAgICAgU2hvdWxkIHdlIHJldmVydCBpdCBvciBkbyB5b3UgaGF2ZSBhbnkgcGxh
bnM/DQogICAgICAgIDxicj4NCiAgICAgICAgPGJyPg0KICAgICAgICBQbGVhc2UgbGV0IG1l
IGtub3cgeW91ciB0aG91Z2h0cy4gPC9ibG9ja3F1b3RlPg0KICAgIDwvYmxvY2txdW90ZT4N
CiAgPC9ib2R5Pg0KPC9odG1sPg0K
--------------50E67CC96C0D167E8661238A--
