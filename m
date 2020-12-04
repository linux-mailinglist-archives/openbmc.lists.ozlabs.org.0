Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDC92CEB92
	for <lists+openbmc@lfdr.de>; Fri,  4 Dec 2020 11:02:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnStr2vTZzDr73
	for <lists+openbmc@lfdr.de>; Fri,  4 Dec 2020 21:02:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=63.128.21.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=venkata_chandrappa@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=KYWswytE; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=FRsimo7P; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnSsM46ndzDrPP
 for <openbmc@lists.ozlabs.org>; Fri,  4 Dec 2020 21:01:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1607076078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uVbA4ROwsu/v1Fdfzpx7PR8y4EU9h1+7a6EIxI3oPSE=;
 b=KYWswytEbov1PVgSA7zfK6PPH8gVhlUP6ayyDeI6ic9dkIizywekHVyUBOin628EzgV+8E
 SPTztr9s+XvPjjGGSqnB7297SAdSWd2orHUreu76eDvotTv0rtW+BJuMmhpeKVPMiVJK//
 /Eq0/5bfjAx/AG/PwR+Sf/ErD0BU/BI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1607076079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uVbA4ROwsu/v1Fdfzpx7PR8y4EU9h1+7a6EIxI3oPSE=;
 b=FRsimo7PqmS+gjB2YWA/R+511/Uvlg5xxNCDZ1H01keE72AK48v0sDIw/cMf6+5Eq88BSr
 FpH8eoCRvIBioakr11rzHNTt87x0bvuH4csySphCxAUTvjIOJfRCI4LGFd45FxOwFCgjhn
 mfyjH4UTRv+hJM2LLH+zL8BM/0S2pBc=
Received: from TWN-EXCHMB-13.phoenix.com (123.51.168.5 [123.51.168.5])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-L7xrS1p7O_irMbvmseRDeQ-1; Fri, 04 Dec 2020 05:01:15 -0500
X-MC-Unique: L7xrS1p7O_irMbvmseRDeQ-1
X-CrossPremisesHeadersFilteredBySendConnector: TWN-EXCHMB-13.phoenix.com
Received: from TWN-EXCHMB-13.phoenix.com
 (2607:f0dc:5001:ff01:3897:a901:3564:6014) by TWN-EXCHMB-13.phoenix.com
 (2607:f0dc:5001:ff01:3897:a901:3564:6014) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Fri, 4 Dec 2020 18:01:10 +0800
Received: from TWN-EXCHMB-13.phoenix.com ([fe80::3897:a901:3564:6014]) by
 TWN-EXCHMB-13.phoenix.com ([fe80::3897:a901:3564:6014%12]) with mapi id
 15.00.1156.000; Fri, 4 Dec 2020 18:01:10 +0800
From: Venkata Chandrappa <Venkata_Chandrappa@phoenix.com>
To: Derick Montague <Derick.Montague@ibm.com>
Subject: RE: LDAP group privilege mapping does not exist
Thread-Topic: LDAP group privilege mapping does not exist
Thread-Index: AdbJh0jl6iWlKGvjRia6TgDbkOc06///+heA//7CUhA=
Date: Fri, 4 Dec 2020 10:01:09 +0000
Message-ID: <30a0cdd8272d469b8207a2d4b41354db@TWN-EXCHMB-13.phoenix.com>
References: <664a67f7de0f4402a9ec217d8c49c7e9@TWN-EXCHMB-13.phoenix.com>
 <OFB52E8381.D86531F6-ON00258633.007D8D31-00258633.007DECA8@notes.na.collabserv.com>
In-Reply-To: <OFB52E8381.D86531F6-ON00258633.007D8D31-00258633.007DECA8@notes.na.collabserv.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.122.168.230]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: TWN-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=venkata_chandrappa@phoenix.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: phoenix.com
Content-Language: en-US
Content-Type: multipart/mixed;
 boundary="_002_30a0cdd8272d469b8207a2d4b41354dbTWNEXCHMB13phoenixcom_"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_002_30a0cdd8272d469b8207a2d4b41354dbTWNEXCHMB13phoenixcom_
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

VGhhbmtzIGZvciB0aGUgcmVzcG9uc2UuIA0KDQpDb3VsZCB5b3UgaGVscCB0byBzaGFyZSBhIGJh
c2ljIExEQVAgc2VydmVyIExESUYgZmlsZSB3aXRoIGFuIHVzZXIgd2hvIGlzIGEgbWVtYmVyIG9m
IGEgZ3JvdXAgd2l0aCB0aGUgcHJpdmlsZWdlcyBhc3NpZ25lZCwgc29tZXRoaW5ndGhhdCB5b3Un
dmUgYWxyZWFkeSB0ZXN0ZWQuIEkndmUgYWxzbyBhdHRhY2hlZCB0aGUgTERJRiBmaWxlIHRoYXQg
SSd2ZSB1c2VkIGZvciBteSB0ZXN0cy4gSSB3YW50IHRvIHJ1bGUgb3V0IExEQVAgY29uZmlndXJh
dGlvbiBlcnJvcnMgdGhhdCBJIG1heSBiZSBvdmVybG9va2luZyBiZWZvcmUgSSBkd2VsdmUgaW50
byB0aGUgQk1DIHNpZGUgaW52ZXN0aWdhdGlvbi4gDQoNCkJlc3QgUmVnYXJkcywNClZlbmthDQoN
Ci0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBEZXJpY2sgTW9udGFndWUgW21haWx0
bzpEZXJpY2suTW9udGFndWVAaWJtLmNvbV0gDQpTZW50OiBGcmlkYXksIERlY2VtYmVyIDQsIDIw
MjAgNjo1NSBBTQ0KVG86IFZlbmthdGEgQ2hhbmRyYXBwYQ0KQ2M6IG9wZW5ibWNAbGlzdHMub3ps
YWJzLm9yZw0KU3ViamVjdDogUmU6IExEQVAgZ3JvdXAgcHJpdmlsZWdlIG1hcHBpbmcgZG9lcyBu
b3QgZXhpc3QNCg0KPiBKb3VybmFsIGxvZ3Mgc2VlbSB0byBpbmRpY2F0ZSB0aGUgbWFwcGluZyBk
b2VzbuKAmXQgZXhpc3QsIHNvIEnigJltIHdvbmRlcmluZyBpZg0KPiB0aGUgcm9sZSBncm91cHMg
YWRkZWQgaW4gQk1DIHdlYiBoYXZlIGJlZW4gc2V0dXAgY29ycmVjdGx5LiAgDQogICANCkkgY2Fu
J3Qgc3BlYWsgdG8gdGhhdCwgYnV0IHdlIGhhZCB0ZXN0ZWQgcm9sZSBncm91cHMgd2hlbiB0aGUg
dmlldyB3YXMgY3JlYXRlZA0KYW5kIHdlIHdlcmUgYWJsZSB0byBsb2dpbiBhbmQgcGVyZm9ybSBh
Y3Rpb25zLiAgDQogICANCj4gT25lIG1vcmUgdGhpbmcgdG8gbm90ZSBpcyB3aGVuIEkgYWRkZWQg
dGhlIHJvbGUgZ3JvdXAsIHRoZXJlIHdhcyBhIDQwNCByZXNwb25zZQ0KPiBnZW5lcmF0ZWQuIEhv
d2V2ZXIsIG9uIHJlZnJlc2hpbmcgdGhlIHBhZ2Ugb3IgbmF2aWdhdGluZyBiYWNrIHRvIHRoZSBw
YWdlLCB0aGUgcm9sZQ0KPiBncm91cCB3YXMgYWRkZWQgc3VjY2Vzc2Z1bGx5LiAgDQogICANClRo
YXQgd2FzIGZpeGVkIGluIGh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJvamVjdC54eXovYy9vcGVu
Ym1jL3dlYnVpLXZ1ZS8rLzM4NjE4LiBJdCB3YXMNCmEgVUkgaXNzdWUsIGJ1dCB0aGUgQVBJIHJl
cXVlc3Qgd2FzIHN1Y2Nlc3NmdWwgYXMgeW91IG5vdGljZWQgYnkgcmVmcmVzaGluZyB0aGUgcGFn
ZS4NCg0K
--_002_30a0cdd8272d469b8207a2d4b41354dbTWNEXCHMB13phoenixcom_
Content-Type: application/octet-stream; name="ldap_data.ldif"
Content-Description: ldap_data.ldif
Content-Disposition: attachment; filename="ldap_data.ldif";
	creation-date="Fri, 04 Dec 2020 10:00:05 GMT";
	modification-date="Fri, 04 Dec 2020 10:00:05 GMT"
Content-Transfer-Encoding: base64


--_002_30a0cdd8272d469b8207a2d4b41354dbTWNEXCHMB13phoenixcom_--

