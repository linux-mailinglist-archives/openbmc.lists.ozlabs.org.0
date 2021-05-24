Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB6038EC8E
	for <lists+openbmc@lfdr.de>; Mon, 24 May 2021 17:16:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fpglh6B1Dz306S
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 01:16:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j8s4+8vQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com;
 envelope-from=bruce.mitchell@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=j8s4+8vQ; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpglM5rvXz2yYH
 for <openbmc@lists.ozlabs.org>; Tue, 25 May 2021 01:15:59 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14OF39v4073191; Mon, 24 May 2021 11:15:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=aAhEi6x7IloT0EjpNPJnk9jPROUFl4OAcn2n+e0bQis=;
 b=j8s4+8vQze7pNE6RZxmsC6eENetPXHBtOAdf+bbnZ/bmc8+OAOfBqNA4gzBgDhfDBCQU
 L9Fxx/r6puoqmAEzltpm5ZCMcGPfFuJIZNSwq3b/A8tZiYn0NODnMwA9xeAKM8gx1wdd
 ymr75JYqiiDvd6tdWoQAbNGNppU0N7v1tm54aKuE4GiMcmehNXaiW9MAkIAHLGuumUOn
 ZpbWzl0pSPaNhcqUeCjKkS1LVRTUV4WtG02lKiAaf4gWtQG1mfAFIRU2cwHdSVByoQqi
 GZuPqYF9rUYxRYxm0PowvuxFrUFjI/0pfmse8Dt6IgaqqCa41aXpJzlwY/0vZ3vYoo7r KQ== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38rcbgmtr2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 May 2021 11:15:49 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14OF9Y2s008590;
 Mon, 24 May 2021 15:15:49 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02wdc.us.ibm.com with ESMTP id 38psk97vtb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 May 2021 15:15:49 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14OFFmeZ28770666
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 May 2021 15:15:48 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68C45B2067;
 Mon, 24 May 2021 15:15:48 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0212CB2065;
 Mon, 24 May 2021 15:15:47 +0000 (GMT)
Received: from [9.211.83.122] (unknown [9.211.83.122])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 24 May 2021 15:15:47 +0000 (GMT)
Subject: Re: SEL Event logs in Redfish
To: Jayashree D <jayashree-d@hcl.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "Bills, Jason M" <jason.m.bills@linux.intel.com>
References: <SG2PR04MB30939A6EEB04348FF51EAC5AE1269@SG2PR04MB3093.apcprd04.prod.outlook.com>
From: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>
Message-ID: <bf927ab3-636a-7d25-e42e-1f5335b4201c@linux.vnet.ibm.com>
Date: Mon, 24 May 2021 08:15:47 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <SG2PR04MB30939A6EEB04348FF51EAC5AE1269@SG2PR04MB3093.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bKl1isLnM0jdh9_NY9XTMOKKlTVK0BCI
X-Proofpoint-ORIG-GUID: bKl1isLnM0jdh9_NY9XTMOKKlTVK0BCI
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-24_08:2021-05-24,
 2021-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105240093
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

T24gNS8yNC8yMDIxIDA2OjQxLCBKYXlhc2hyZWUgRCB3cm90ZToNCj4gQ2xhc3NpZmljYXRp
b246IENvbmZpZGVudGlhbA0KPiBIaSBUZWFtLA0KPiANCj4gSSBuZWVkIHNvbWUgY2xhcmlm
aWNhdGlvbiBvbiBTRUwgTG9ncy4NCj4gSW4gU0VMIEV2ZW50IGxvZ3MsIHdoZW4gdGhlIGVy
cm9yIGlzIGluamVjdGVkIG1hbnVhbGx5ICwgSSBjYW4gYWJsZSB0byBzZWUgdGhlIGVycm9y
IGxvZ3MgaW4gImlwbWl0b29sIHNlbCBsaXN0IiBjb21tYW5kLg0KPiBXaGV0aGVyIGl0IHdp
bGwgYWxzbyByZWZsZWN0IGluIFJlZGZpc2ggQVBJID8NCj4gDQo+IENvdWxkIHlvdSBwbGVh
c2UgaGVscCBtZSBpbiB0aGlzLg0KPiANCj4gVGhhbmtzLA0KPiBKYXlhc2hyZWUNCj4gDQo+
IDo6RElTQ0xBSU1FUjo6DQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+
IFRoZSBjb250ZW50cyBvZiB0aGlzIGUtbWFpbCBhbmQgYW55IGF0dGFjaG1lbnQocykgYXJl
IGNvbmZpZGVudGlhbCBhbmQgaW50ZW5kZWQgZm9yIHRoZSBuYW1lZCByZWNpcGllbnQocykg
b25seS4gRS1tYWlsIHRyYW5zbWlzc2lvbiBpcyBub3QgZ3VhcmFudGVlZCB0byBiZSBzZWN1
cmUgb3IgZXJyb3ItZnJlZSBhcyBpbmZvcm1hdGlvbiBjb3VsZCBiZSBpbnRlcmNlcHRlZCwg
Y29ycnVwdGVkLCBsb3N0LCBkZXN0cm95ZWQsIGFycml2ZSBsYXRlIG9yIGluY29tcGxldGUs
IG9yIG1heSBjb250YWluIHZpcnVzZXMgaW4gdHJhbnNtaXNzaW9uLiBUaGUgZSBtYWlsIGFu
ZCBpdHMgY29udGVudHMgKHdpdGggb3Igd2l0aG91dCByZWZlcnJlZCBlcnJvcnMpIHNoYWxs
IHRoZXJlZm9yZSBub3QgYXR0YWNoIGFueSBsaWFiaWxpdHkgb24gdGhlIG9yaWdpbmF0b3Ig
b3IgSENMIG9yIGl0cyBhZmZpbGlhdGVzLiBWaWV3cyBvciBvcGluaW9ucywgaWYgYW55LCBw
cmVzZW50ZWQgaW4gdGhpcyBlbWFpbCBhcmUgc29sZWx5IHRob3NlIG9mIHRoZSBhdXRob3Ig
YW5kIG1heSBub3QgbmVjZXNzYXJpbHkgcmVmbGVjdCB0aGUgdmlld3Mgb3Igb3BpbmlvbnMg
b2YgSENMIG9yIGl0cyBhZmZpbGlhdGVzLiBBbnkgZm9ybSBvZiByZXByb2R1Y3Rpb24sIGRp
c3NlbWluYXRpb24sIGNvcHlpbmcsIGRpc2Nsb3N1cmUsIG1vZGlmaWNhdGlvbiwgZGlzdHJp
YnV0aW9uIGFuZCAvIG9yIHB1YmxpY2F0aW9uIG9mIHRoaXMgbWVzc2FnZSB3aXRob3V0IHRo
ZSBwcmlvciB3cml0dGVuIGNvbnNlbnQgb2YgYXV0aG9yaXplZCByZXByZXNlbnRhdGl2ZSBv
ZiBIQ0wgaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4gSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhp
cyBlbWFpbCBpbiBlcnJvciBwbGVhc2UgZGVsZXRlIGl0IGFuZCBub3RpZnkgdGhlIHNlbmRl
ciBpbW1lZGlhdGVseS4gQmVmb3JlIG9wZW5pbmcgYW55IGVtYWlsIGFuZC9vciBhdHRhY2ht
ZW50cywgcGxlYXNlIGNoZWNrIHRoZW0gZm9yIHZpcnVzZXMgYW5kIG90aGVyIGRlZmVjdHMu
DQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IA0KDQpIaSBKYXlhc2hy
ZWUsDQoNCkkgc3VnZ2VzdCB5b3UgY29ubmVjdCB3aXRoIEphc29uIEJpbGxzIG9uIFNFTC4N
Cg0KDQo=
