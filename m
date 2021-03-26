Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B78A34A8FF
	for <lists+openbmc@lfdr.de>; Fri, 26 Mar 2021 14:51:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6Nfm36tgz3fWS
	for <lists+openbmc@lfdr.de>; Sat, 27 Mar 2021 00:51:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e/L1EqX1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com;
 envelope-from=bruce.mitchell@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=e/L1EqX1; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6NZg4QpSz3dfG
 for <openbmc@lists.ozlabs.org>; Sat, 27 Mar 2021 00:47:39 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12QDZEF2191474; Fri, 26 Mar 2021 09:47:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=UihVzL9xrgi48luWSOCorTCYHvLlBGIkkzMZyfvEqZY=;
 b=e/L1EqX1M5oAudmMXvChvLznzHXPilIdVACBl+CfQGi3633GOHvYYrBpYxCyBCg+yoS7
 C44VdtMxZM2D27rmIBTMIzBDcPNBmJfd+QArVpsBPIU7oqbezgv5GHY/pS49g4fpN9RC
 hdo0Hv/zTpixje63GFp6Wk4pTh+5ThkgrrKBp73MYZBR80fs1Sj7CuDR5A48ue1eGULd
 W46YTy9t1Ei0TpvsMXiLfyKGidG7ruQx+2BNDOxbR4MJJZdAAvTquFTgoYtT65+e7y+3
 eZt/GO7AjHwhoqB61RLUmEtIbWGY+iHJGG/iC+g86b9I1nmmY9NgeMb/7BHbOHu/35kx Bw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37h75dpqca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 09:47:34 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12QDZVfo192627;
 Fri, 26 Mar 2021 09:47:34 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37h75dpqc1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 09:47:34 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12QDhQDb006366;
 Fri, 26 Mar 2021 13:47:33 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01wdc.us.ibm.com with ESMTP id 37h14wngrc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 13:47:33 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12QDlWis28443090
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 13:47:32 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AAA476E050;
 Fri, 26 Mar 2021 13:47:32 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D7766E04C;
 Fri, 26 Mar 2021 13:47:32 +0000 (GMT)
Received: from [9.211.35.131] (unknown [9.211.35.131])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 26 Mar 2021 13:47:32 +0000 (GMT)
Subject: Re: IPMI SEL Parsing
To: rgrs <rgrs@protonmail.com>, "Bills, Jason M"
 <jason.m.bills@linux.intel.com>
References: <gmu36wVnmbV9lyt9EpYcnZmnPwjF9wtDS0N8K0jOk9UR2uUO0QwQaackzJRPLjil_ZqLxTzX3qEMGl3IE6baoIpS-xh9aMnQL3VkAyXK6KU=@protonmail.com>
 <0a6dd101-fbea-7fdf-b9a6-3895b48a7f47@linux.ibm.com>
 <5197cbe7-1a8b-80ab-2712-9a8f07457432@linux.vnet.ibm.com>
 <nGEUmLQrNSqmytvShVUeFvOUKjW1cOTYv9Hrcmj7LyP1rfIdLOt8f7IkqzPKaXHZXHRGYtHBcjnt6Qo5c1fIw4doEmVwMmGI2e2rNhNXWZw=@protonmail.com>
From: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>
Message-ID: <5bcbc6b0-b9d3-a002-0f24-97bd91ba5bf8@linux.vnet.ibm.com>
Date: Fri, 26 Mar 2021 06:47:32 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <nGEUmLQrNSqmytvShVUeFvOUKjW1cOTYv9Hrcmj7LyP1rfIdLOt8f7IkqzPKaXHZXHRGYtHBcjnt6Qo5c1fIw4doEmVwMmGI2e2rNhNXWZw=@protonmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UPYhkfhp0qt7okWsQ9kQ1RRc3ILyl9dZ
X-Proofpoint-ORIG-GUID: aYI4Ip3OSKf-kHQvGRedXveXSaZwyILO
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-26_06:2021-03-26,
 2021-03-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1011
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103260103
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gMy8yNi8yMDIxIDAxOjA0LCByZ3JzIHdyb3RlOg0KPiBIaSBNYXR0LCBCcnVjZSwNCj4g
DQo+IFllcywgU0VMcyBmb3Igc2Vuc29yIGV2ZW50cywgdGhyZXNob2xkIGFsYXJtcy4NCj4g
V2hlbiBhIHNlbnNvciB2YWx1ZSBpcyBiZXlvbmQgdGhlIHJhbmdlIG9mIHRocmVzaG9sZHMs
IHdlIG5lZWQgdG8gbG9nIHRoZSBTRUwuDQo+IA0KPiBNeSB1bmRlcnN0YW5kaW5nIG9mIE9w
ZW5CTUMgaW1wbGVtZW50YXRpb246DQo+IGRidXMtc2Vuc29ycy9waG9zcGhvci1od21vbiBs
b2dzIGQtYnVzIGVycm9ycyAobG9nZ2luZy9lbnRyeSkuDQo+IEVhY2ggZW50cnkgb2JqZWN0
IGhhcyBhICJjYWxsb3V0IiwgdGhhdCBpcyB1c2VkIGJ5IHBob3NwaG9yLWlwbWktaG9zdCB0
byBjb252ZXJ0IGRidXMtZXJyb3IgbG9ncyB0byBJUE1JIFNFTCAoMTYgYnl0ZXMpLg0KPiAN
Cj4gDQo+IFRoZSBpc3N1ZSBJIGFtIGZhY2luZzoNCj4gMS4gU0VMIGNyZWF0aW9uOiB3aGVu
IEkgY2hhbmdlIHNlbnNvciB0aHJlc2hvbGRzLCBJIGRvbid0IHNlZSBhIGxvZyBnZW5lcmF0
ZWQgZm9yIHRoYXQgc2Vuc29yLg0KPiAocGhvc3Bob3Itc2VsLWxvZ2dlciBoYXMgdGhlIGNh
cGFiaWxpdHkgdG8gbW9uaXRvciB0aHJlc2hvbGQgZXZlbnRzIGFuZCBsb2cgU0VMLiBCdXQg
cGhvc3Bob3ItaHdtb24gZG9lc24ndCBnZW5lcmF0ZSB0aGUgc2lnbmFsIHRoYXQgcGhvc3Bo
b3Itc2VsLWxvZ2dlciBpcyBsb29raW5nIGZvci4pDQo+IA0KPiAyLiBQcmludGluZyBTRUxz
OiB3aGVuIEkgbWFudWFsbHkgYWRkIGxvZ2dpbmcvZW50cnkgdXNpbmcgYnVzY3RsLCBpcG1p
dG9vbCBwcmludHMgIlVuZGV0ZXJtaW5lZCBIYXJkd2FyZSBGYWlsdXJlIi4NCj4gKGxvZ2dp
bmcvZW50cnkvPG51bWJlcj4gaXMgbm90IGhhdmluZyBjYWxsb3V0IGFzc29jaWF0aW9uIHRv
IHNlbnNvci9GUlUpDQo+IA0KPiBXaGVyZS93aGF0IHNob3VsZCBJIGNvbmZpZ3VyZSBzbyB0
aGF0IFNFTHMgYXJlIGdlbmVyYXRlZCBhbmQgcGFyc2VkIHByb3Blcmx5Pw0KPiBEaWZmZXJl
bnQgcGllY2VzIG9mIElQTUkgZnVuY3Rpb25hbGl0eSBpcyBzY2F0dGVyZWQgYW1vbmcgdmFy
aW91cyBwYWNrYWdlcywgSSdtIG5vdCBhYmxlIHRvIHN0aXRjaCB0aGVtIHRvZ2V0aGVyLg0K
PiANCj4gVGhhbmtzLA0KPiBSYWoNCj4gDQo+IOKAkOKAkOKAkOKAkOKAkOKAkOKAkCBPcmln
aW5hbCBNZXNzYWdlIOKAkOKAkOKAkOKAkOKAkOKAkOKAkA0KPiBPbiBGcmlkYXksIDI2IE1h
cmNoIDIwMjEgMDM6NTksIEJydWNlIE1pdGNoZWxsIDxicnVjZS5taXRjaGVsbEBsaW51eC52
bmV0LmlibS5jb20+IHdyb3RlOg0KPiANCj4+IE9uIDMvMjUvMjAyMSAxNToxNiwgTWF0dCBT
cGlubGVyIHdyb3RlOg0KPj4NCj4+PiBPbiAzLzI1LzIwMjEgNzo0OSBBTSwgcmdycyB3cm90
ZToNCj4+Pg0KPj4+PiBIaSBBbGwsICJpcG1pdG9vbCBzZWwgbGlzdCIgYWx3YXlzIHNob3dz
IHRoZSByZWNvcmRzIGFzICJVbmRldGVybWluZWQNCj4+Pj4gc3lzdGVtIGhhcmR3YXJlIGZh
aWx1cmUiLiBMb2dnaW5nL2VudHJ5IGRvZXNuJ3QgaGF2ZSB0aGUgcHJvcGVyDQo+Pj4+IGFz
c29jaWF0aW9uLiBIb3cgZG8gSSBhZGQgYXNzb2NpYXRpb24gZm9yIGxvZyBlbnRyaWVzIGFu
ZCByZXNwZWN0aXZlDQo+Pj4+IEZSVXM/IFdoaWNoIHBhY2thZ2UgY3JlYXRlcyBMb2dnaW5n
L2VudHJ5IEhpIEFsbCwNCj4+Pj4gImlwbWl0b29sIHNlbCBsaXN0IiBhbHdheXMgc2hvd3Mg
dGhlIHJlY29yZHMgYXMgIlVuZGV0ZXJtaW5lZCBzeXN0ZW0NCj4+Pj4gaGFyZHdhcmUgZmFp
bHVyZSIuDQo+Pj4+IExvZ2dpbmcvZW50cnkgZG9lc24ndCBoYXZlIHRoZSBwcm9wZXIgYXNz
b2NpYXRpb24uIEhvdyBkbyBJIGFkZA0KPj4+PiBhc3NvY2lhdGlvbiBmb3IgbG9nIGVudHJp
ZXMgYW5kIHJlc3BlY3RpdmUgRlJVcz8NCj4+Pj4gV2hpY2ggcGFja2FnZSBjcmVhdGVzIExv
Z2dpbmcvZW50cnkgb2JqZWN0IG9uIHNlbnNvciBldmVudHM/IEkgZG9uJ3QNCj4+Pj4gc2Vl
IGFueSBjYWxsIHRvIFNlbEFkZCBpbiBwaG9zcGhvci1od21vbi4NCj4+Pg0KPj4+IFdoYXQg
YXJlIHRoZSBTRUxzIGZvciAtIHRocmVzaG9sZCBhbGFybXMsIG9yIHNvbWUgb3RoZXIgc29y
dCBvZiBmYWlsdXJlcz8NCj4+Pg0KPj4+PiBUaGFua3MsDQo+Pj4+IFJhag0KPj4NCj4+IE15
IGFzc3VtcHRpb24gaXMgdGhhdCBub3QgZXZlcnlvbmUgaW4gdGhlIE9wZW5CTUMgY29tbXVu
aXR5IGhhcw0KPj4gZXh0ZW5zaXZlIHVzZSB3aXRoIElQTUksIHRodXMgdGhpcyBqdXN0IHRv
IHNoYXJlIGluZm9ybWF0aW9uLg0KPj4gU29ycnkgdG8gdGhvc2Ugd2hvIGFscmVhZHkga25v
dyB0aGlzIGluZm9ybWF0aW9uIGFuZCBoYXZlIGJlZW4NCj4+IHVzaW5nIGl0IGZvciB5ZWFy
cy4NCj4+DQo+PiBUaGlzIGlzIHNoYXJlIGJhY2tncm91bmQgYXMgdG8gdGhlIGhpc3Rvcnkg
b3IgYmFja2dyb3VuZCBvZiB0aGUNCj4+IElQTUkgU0VMOyBwcm9iYWJseSBtb3JlIGluZm9y
bWF0aW9uIHRoYW4geW91IG5lZWQuIEJ1dCBJIHdvdWxkDQo+PiByYXRoZXIgc2hhcmUgMTAl
IHRvbyBtdWNoIHRoYW4gYmUgc2hvcnQgYnkgMC4xJS4NCj4+DQo+PiAgRnJvbSBJbnRlbGxp
Z2VudCBQbGF0Zm9ybSBNYW5hZ2VtZW50IEludGVyZmFjZSBTcGVjaWZpY2F0aW9uIFNlY29u
ZA0KPj4gR2VuZXJhdGlvbiB2Mi4wDQo+PiBEb2N1bWVudCBSZXZpc2lvbiAxLjEgT2N0b2Jl
ciAxLCAyMDEzDQo+Pg0KPj4gMzEuIFN5c3RlbSBFdmVudCBMb2cgKFNFTCkgQ29tbWFuZHM6
DQo+Pg0KPj4gVGhlIFN5c3RlbSBFdmVudCBMb2cgaXMgYSBub24tdm9sYXRpbGUgcmVwb3Np
dG9yeSBmb3Igc3lzdGVtIGV2ZW50cyBhbmQNCj4+IGNlcnRhaW4gc3lzdGVtIGNvbmZpZ3Vy
YXRpb24gaW5mb3JtYXRpb24uIFRoZSBkZXZpY2UgdGhhdCBmaWVsZHMgdGhlDQo+PiBjb21t
YW5kcyB0byBhY2Nlc3MgdGhlIFNFTCBpcyByZWZlcnJlZCB0byBhcyB0aGUgU3lzdGVtIEV2
ZW50IExvZyBEZXZpY2UNCj4+IG9yIFNFTCBEZXZpY2UuDQo+Pg0KPj4gRXZlbnQgTWVzc2Fn
ZSBpbmZvcm1hdGlvbiBpcyBub3JtYWxseSB3cml0dGVuIGludG8gdGhlIFNFTCBhZnRlciBi
ZWluZw0KPj4gcmVjZWl2ZWQgYnkgdGhlIEV2ZW50IFJlY2VpdmVyIGZ1bmN0aW9uYWxpdHkg
aW4gdGhlIEV2ZW50IFJlY2VpdmVyIERldmljZS4NCj4+DQo+PiBUaGUgU0VMIERldmljZSBj
b21tYW5kcyBhcmUgc3RydWN0dXJlZCBpbiBzdWNoIGEgd2F5IHRoYXQgdGhlIFNFTCBEZXZp
Y2UNCj4+IGNvdWxkIGFjdHVhbGx5IGJlIHNlcGFyYXRlZCBmcm9tIHRoZSBFdmVudCBSZWNl
aXZlciBEZXZpY2UuIEluIHdoaWNoDQo+PiBjYXNlIGl0IHdvdWxkIGJlIHRoZSByZXNwb25z
aWJpbGl0eSBvZiB0aGUgRXZlbnQgUmVjZWl2ZXIgRGV2aWNlIHRvIHNlbmQNCj4+IHRoZSBh
cHByb3ByaWF0ZSDigJhBZGQgU0VMIEVudHJ54oCZIG1lc3NhZ2UgZGlyZWN0bHkgdG8gdGhl
IFNFTCBEZXZpY2UsIG9yDQo+PiB0byBwYXNzIHRoZSBlcXVpdmFsZW50IHJlcXVlc3QgdGhy
b3VnaCBhbiBpbnRlcm1lZGlhcnkuDQo+Pg0KPj4gU0VMIEVudHJpZXMgaGF2ZSBhIHVuaXF1
ZSDigJhSZWNvcmQgSUTigJkgZmllbGQuIFRoaXMgZmllbGQgaXMgdXNlZCBmb3INCj4+IHJl
dHJpZXZpbmcgbG9nIGVudHJpZXMgZnJvbSB0aGUgU0VMLiBTRUwgcmVhZGluZyBjYW4gYmUg
ZG9uZSBpbiBhDQo+PiDigJhyYW5kb20gYWNjZXNz4oCZIG1hbm5lci4gVGhhdCBpcywgU0VM
IEVudHJpZXMgY2FuIGJlIHJlYWQgaW4gYW55IG9yZGVyDQo+PiBhc3N1bWluZyB0aGF0IHRo
ZSBSZWNvcmQgSUQgaXMga25vd24uDQo+Pg0KPj4gU0VMIFJlY29yZCBJRHMgMDAwMGggYW5k
IEZGRkZoIGFyZSByZXNlcnZlZCBmb3IgZnVuY3Rpb25hbCB1c2UgYW5kIGFyZQ0KPj4gbm90
IGxlZ2FsIElEIHZhbHVlcy4gUmVjb3JkIElEcyBhcmUgaGFuZGxlcy4gVGhleSBhcmUgbm90
IHJlcXVpcmVkIHRvIGJlDQo+PiBzZXF1ZW50aWFsIG9yIGNvbnNlY3V0aXZlLiBBcHBsaWNh
dGlvbnMgc2hvdWxkIG5vdCBhc3N1bWUgdGhhdCBTRUwNCj4+IFJlY29yZCBJRHMgd2lsbCBm
b2xsb3cgYW55IHBhcnRpY3VsYXIgbnVtZXJpYyBvcmRlcmluZy4NCj4+DQo+PiBTRUwgUmVj
b3JkcyBhcmUga2VwdCBhcyBhbiBvcmRlcmVkIGxpc3QuIFRoYXQgaXMsIGFwcGVuZGluZyBh
bmQgZGVsZXRpbmcNCj4+IGluZGl2aWR1YWwgZW50cmllcyBkb2VzIG5vdCBjaGFuZ2UgdGhl
IGFjY2VzcyBvcmRlciBvZiBlbnRyaWVzIHRoYXQNCj4+IHByZWNlZGUgb3IgZm9sbG93IHRo
ZSBwb2ludCBvZiBhZGRpdGlvbiBvciBkZWxldGlvbi4NCj4+DQo+PiAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tDQo+Pg0KPj4gQnJ1Y2UNCj4gDQo+IA0KDQpBZGRpbmcgSmFz
b24gdG8gdGhlIFRPIGxpc3QuICBBbnkgdGhvdWdodHMgb24gdGhpcyBKYXNvbj8NCg0KLS0g
DQpCcnVjZQ0KDQo=
