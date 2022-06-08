Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AAD543DA5
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 22:40:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJJyg5Pgnz2yw7
	for <lists+openbmc@lfdr.de>; Thu,  9 Jun 2022 06:40:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ztsystems.com header.i=@ztsystems.com header.a=rsa-sha256 header.s=mimecast20210607 header.b=H82QQgPM;
	dkim=pass (1024-bit key) header.d=ztsystems.com header.i=@ztsystems.com header.a=rsa-sha256 header.s=mimecast20210607 header.b=lh+Nx8/g;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ztsystems.com (client-ip=170.10.133.115; helo=us-smtp-delivery-115.mimecast.com; envelope-from=jeff.friedman@ztsystems.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ztsystems.com header.i=@ztsystems.com header.a=rsa-sha256 header.s=mimecast20210607 header.b=H82QQgPM;
	dkim=pass (1024-bit key) header.d=ztsystems.com header.i=@ztsystems.com header.a=rsa-sha256 header.s=mimecast20210607 header.b=lh+Nx8/g;
	dkim-atps=neutral
Received: from us-smtp-delivery-115.mimecast.com (us-smtp-delivery-115.mimecast.com [170.10.133.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJJyF08mlz3bn5
	for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2022 06:40:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ztsystems.com;
	s=mimecast20210607; t=1654720816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P/L6n+2wiEmkGjk7BRzcxYtQOG8/Sd1FfDhOSksAy9A=;
	b=H82QQgPMeUItLLyPoM+XOns3OJbmOi1cMwPgK4QsISBVH4UVi9YAxHUF6YouPOWygi8+ef
	sFTY+2RBRQFY/yXImEOlyg7rpSxzllUuT6BZvM6D6Iv9IzRrMINJg6h6rTJVOwM5hRg6J6
	itURQQ8dn8UdRrB1JY92xA0dg6ttV64=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ztsystems.com;
	s=mimecast20210607; t=1654720817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P/L6n+2wiEmkGjk7BRzcxYtQOG8/Sd1FfDhOSksAy9A=;
	b=lh+Nx8/g+L23QXCNjU15FWnTWCBVEZn5PeIKL4wRcbDiX/RCVvKrSICtEkGLrxbzCgKey6
	eJwSZtgzCN8Nmyqiv+YQU06TziAh/r/Pu1zJtN6UxTRIqWYbYV5AS9K+Hbq8jVJ3BHaUiS
	Apnjqd+kcW5OSzfMDWFV+eA5KPMVM6M=
Received: from ztcsla-ex01.ztgroup.com (67.212.155.84.static.coresite.com
 [67.212.155.84]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-zX3gG3rdPv-cPGpmqb7hNQ-1; Wed, 08 Jun 2022 16:40:15 -0400
X-MC-Unique: zX3gG3rdPv-cPGpmqb7hNQ-1
Received: from ztcsla-ex01.ztgroup.com (10.1.80.51) by ztcsla-ex01.ztgroup.com
 (10.1.80.51) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Wed, 8 Jun
 2022 13:40:13 -0700
Received: from ztcsla-ex01.ztgroup.com ([fe80::f4f5:f679:b90b:d1a5]) by
 ztcsla-ex01.ztgroup.com ([fe80::f4f5:f679:b90b:d1a5%5]) with mapi id
 15.01.2308.027; Wed, 8 Jun 2022 13:40:13 -0700
From: Jeff Friedman <jeff.friedman@ztsystems.com>
To: Ed Tanous <edtanous@google.com>
Subject: RE: [EXTERNAL] Re: FW: Newbie question on Redfish URI resource names
Thread-Topic: [EXTERNAL] Re: FW: Newbie question on Redfish URI resource names
Thread-Index: Adh7YaUQhINiiir+SKqIjbsJIX1DoQAAREzAABEc6QAAC9YT0A==
Date: Wed, 8 Jun 2022 20:40:13 +0000
Message-ID: <0cc1dd2a26d0475d8a2a72eb87055b4f@ztsystems.com>
References: <1593fdf40a6046a7a614407f7d08be15@ztsystems.com>
 <68063aedd81c42b39d1b343e3a0748b5@ztsystems.com>
 <CAH2-KxDSO6UUm0k-cdEQnTdqd=_-Hw9eCuysCzrRpRvdJ=eoZw@mail.gmail.com>
In-Reply-To: <CAH2-KxDSO6UUm0k-cdEQnTdqd=_-Hw9eCuysCzrRpRvdJ=eoZw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYW1WbVppNW1jbWxsWkcxaGJseGhjSEJrWVhSaFhISnZZVzFwYm1kY01E?=
 =?utf-8?B?bGtPRFE1WWpZdE16SmtNeTAwWVRRd0xUZzFaV1V0Tm1JNE5HSmhNamxsTXpW?=
 =?utf-8?B?aVhHMXpaM05jYlhObkxUTXdOekJoT0dFMExXVTNObUl0TVRGbFl5MWlOakEy?=
 =?utf-8?B?TFdVME5XVXpOek16TldJNVpGeGhiV1V0ZEdWemRGd3pNRGN3WVRoaE5pMWxO?=
 =?utf-8?B?elppTFRFeFpXTXRZall3TmkxbE5EVmxNemN6TXpWaU9XUmliMlI1TG5SNGRD?=
 =?utf-8?B?SWdjM285SWpNMk5EUWlJSFE5SWpFek1qazVNVGswTkRFeE1qQTFPVEkwTVNJ?=
 =?utf-8?B?Z2FEMGlkRzU1VURsTk5EUm5UV1ZJUnpZemRrbG5iRTkyTm05VmFGZDNQU0ln?=
 =?utf-8?B?YVdROUlpSWdZbXc5SWpBaUlHSnZQU0l4SWlCamFUMGlZMEZCUVVGRlVraFZN?=
 =?utf-8?B?VkpUVWxWR1RrTm5WVUZCVFVsRlFVRkNjSE00Ym5sa00zWlpRVmhWTHk5U05V?=
 =?utf-8?B?RXpUR3hFWkZRdk9VaHJSR04xVlUxSVFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVoQlFVRkJRbE5DUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVVZCUVZGQlFrRkJRVUZQY3pOWFQyZEJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGS05FRkJRVUpvUVVkUlFWcEJRbmxCUjFWQlkzZENla0ZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJSVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZuUVVGQlFVRkJibWRCUVVGSFRVRlpkMEptUVVkTlFXUlJRbnBC?=
 =?utf-8?B?U0ZGQlluZENkRUZHT0VGWlVVSjFRVWhyUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVZGQlFVRkJRVUZCUVVGRFFVRkJRVUZCUTJWQlFVRkJXWGRDTVVGSVRV?=
 =?utf-8?B?RmtRVUoyUVVjd1FWaDNRbmRCUjFWQlkyZENla0ZIT0VGaVowRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJSa0ZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVSkJRVUZCUVVGQlFVRkJTVUZCUVVGQlFVbzBRVUZC?=
 =?utf-8?B?UW1wQlNGVkJZM2RDTUVGSE9FRmlVVUptUVVoQlFXRkJRblpCUnpSQldsRkNk?=
 =?utf-8?B?VUZJVlVGaVVVSnBRVWRWUVdOblFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVWQlFVRkJRVUZCUVVGQlFVRkJRVUZGUVVGQlFVRkJRVUZCUVdkQlFV?=
 =?utf-8?B?RkJRVUZ1WjBGQlFVZE5RV1JSUW5wQlNGRkJZbmRDZEVGR09FRmpkMEo2UVVj?=
 =?utf-8?B?MFFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlVVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVTkJRVUZCUVVGRFpVRkJRVUZhVVVKMFFVZEZRV0ZSUW5OQlJqaEJX?=
 =?utf-8?B?VkZDYTBGSFVVRmpaMEpzUVVoTlFXTjNRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZGUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRa0ZCUVVGQlFVRkJRVUZKUVVGQlFVRkJTalJCUVVGQ05rRklVVUZZZDBK?=
 =?utf-8?B?cVFVYzRRV0puUW0xQlIydEJXa0ZDYkVGSE5FRmtRVUp3UVVkRlFXSkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVWQlFVRkJRVUZCUVVGQlowRkJRVUZCUVNJdlBqd3Zi?=
 =?utf-8?Q?WV0YT4=3D?=
x-dg-rorf: true
x-originating-ip: [10.1.80.38]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA15A415 smtp.mailfrom=jeff.friedman@ztsystems.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: ztsystems.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
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

VGhpcyBhbnN3ZXJzIG15IHF1ZXN0aW9uLCB0aGFuayB5b3UuIEkgd2lsbCBjaGVjayBvdXQgdGhl
ICNibWN3ZWItYW5kLXJlZGZpc2ggY2hhbm5lbCBhcyB3ZWxsLg0KDQpUaGFua3MgYWdhaW4hDQoN
CkplZmYgRnJpZWRtYW4NCg0KDQpUaGlzIGVtYWlsIGFuZCBhbnkgZmlsZXMgdHJhbnNtaXR0ZWQg
d2l0aCBpdCBhcmUgcHJpdmlsZWdlZC9jb25maWRlbnRpYWwgYW5kIGludGVuZGVkIHNvbGVseSBm
b3IgdGhlIHVzZSBvZiB0aGUgaW5kaXZpZHVhbCB0byB3aG9tIHRoZXkgYXJlIGFkZHJlc3NlZC4g
SWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlbWFpbCBpbiBlcnJvciwgeW91IGFyZSBub3QgYXV0
aG9yaXplZCB0byBkaXN0cmlidXRlIGl0IGluIHdob2xlIG9yIGluIHBhcnQuIFRoaXMgY29tbXVu
aWNhdGlvbiBkb2VzIG5vdCBjb25zdGl0dXRlIGEgY29udHJhY3Qgb2ZmZXIsIGFtZW5kbWVudCwg
b3IgYWNjZXB0YW5jZSBvZiBhIGNvbnRyYWN0IG9mZmVyLCB1bmxlc3MgZXhwbGljaXRseSBzdGF0
ZWQuwqANCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEVkIFRhbm91cyA8ZWR0
YW5vdXNAZ29vZ2xlLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIEp1bmUgOCwgMjAyMiAxMjoxOCBQ
TQ0KVG86IEplZmYgRnJpZWRtYW4gPGplZmYuZnJpZWRtYW5AenRzeXN0ZW1zLmNvbT4NCkNjOiBv
cGVuYm1jQGxpc3RzLm96bGFicy5vcmcNClN1YmplY3Q6IFtFWFRFUk5BTF0gUmU6IEZXOiBOZXdi
aWUgcXVlc3Rpb24gb24gUmVkZmlzaCBVUkkgcmVzb3VyY2UgbmFtZXMNCg0KT24gV2VkLCBKdW4g
OCwgMjAyMiBhdCAxMToxMCBBTSBKZWZmIEZyaWVkbWFuIDxqZWZmLmZyaWVkbWFuQHp0c3lzdGVt
cy5jb20+IHdyb3RlOg0KPg0KPiBIZWxsbyBhbGwsDQo+DQo+DQo+DQo+IE5ldyB0byBPcGVuQk1D
LCBhbmQgYW0gbm90IGNsZWFyIG9uIG9uZSB0aGluZyBhcyBwZXJ0YWluaW5nIHRvIHRoZSBSZWRm
aXNoIHNjaGVtYSBhbmQgVVJJIHJlc291cmNlIG5hbWVzOg0KPg0KPg0KPg0KPiBUaGUgRE1URiBS
ZWRmaXNoIHNjaGVtYSBVUklzIGFyZSBkZWZpbmVkIGFzOg0KPg0KPg0KPg0KPiAvcmVkZmlzaC92
MS9DaGFzc2lzL3tDaGFzc2lzSWR9Lw0KPg0KPiAvcmVkZmlzaC92MS9NYW5hZ2Vycy97TWFuYWdl
cklkfQ0KPg0KPiAvcmVkZmlzaC92MS9TeXN0ZW1zL3tDb21wdXRlclN5c3RlbUlkfQ0KPg0KPg0K
Pg0KPiBWZW5kb3JzIGNhbiB1c2UgdGhlaXIgb3duIG5hbWVzIGZvciB7Q2hhc3Npc0lkfSwge01h
bmFnZXJJZH0sIGFuZCB7Q29tcHV0ZXJTeXN0ZW1JZH0gYXMgbG9uZyBhcyB0aGV5IGNvbmZvcm0g
dG8gdGhlIHN5bnRheCBydWxlcy4NCj4NCj4NCj4NCj4gUXVlc3Rpb246IERvZXMgT3BlbkJNQyBz
cGVjaWZ5IG5hbWVzIGZvciB0aGVzZSByZXNvdXJjZXMgYXMgcGFydCBvZiB0aGUgT3BlbkJNQyBz
cGVjPyBPciBkb2VzIE9wZW5CTUMganVzdCByZWZlciB0byB0aGUgZXhpc3RpbmcgRE1URiBSZWRm
aXNoIHNjaGVtYXM/DQoNCk9wZW5CTUMgZG9lcyBub3Qgc3BlY2lmeSBub3IgZ3VhcmFudGVlIHRo
ZXNlIG5hbWVzLCB3aGljaCBpcyBpbiBsaW5lIHdpdGggdGhlIFJlZGZpc2ggc3BlY2lmaWNhdGlv
bi4gIFRoZSBzcGVjIGVzc2VudGlhbGx5IHN0YXRlcyB0aGF0IG9kYXRhLmlkIGlzIGZvciB3YWxr
aW5nIHRoZSBSZWRmaXNoIHRyZWUsIGFuZCBub3RoaW5nIGVsc2UuICBJZiB5b3Ugd2FudCB0byBn
ZXQgYSBzaW5nbGUgb2JqZWN0LCB5b3UgbmVlZCB0byByZWx5IG9uICRmaWx0ZXIgKGVpdGhlciBs
b2NhbGx5IG9yIG9uIHRoZSBjbGllbnQgc2lkZSkuDQoNCj4NCj4NCj4NCj4gSSBhc2sgYmVjYXVz
ZSBJIGhhdmUgc2VlbiByZWZlcmVuY2UgdG8gdGhlIGZvbGxvd2luZyBuYW1lcyBpbiBleGFtcGxl
cyBmb3IgTWFuYWdlcnMgYW5kIFN5c3RlbXMgb24gdGhlIE9wZW5CTUMgd2Vic2l0ZToNCj4NCj4N
Cj4NCj4gL3JlZGZpc2gvdjEvQ2hhc3Npcy97Q2hhc3Npc0lkfS8NCj4NCj4gL3JlZGZpc2gvdjEv
TWFuYWdlcnMvYm1jLw0KPg0KPiAvcmVkZmlzaC92MS9TeXN0ZW1zL3N5c3RlbS8NCg0KVGhlIGhh
cmRjb2RlZCBpZHMgb2YgImJtYyIgYW5kICJzeXN0ZW0iIGFyZSB0aGluZ3Mgd2UncmUgYWN0aXZl
bHkgdHJ5aW5nIHRvIGZpeCwgYmVjYXVzZSB3ZSBuZWVkIHRvIHN1cHBvcnQgc3lzdGVtcyB3aXRo
IG1vcmUgdGhhbiBvbmUgbWFuYWdlbWVudCBjb250cm9sbGVyLCBhbmQgbW9yZSB0aGFuIG9uZSBD
b21wdXRlclN5c3RlbSByZXNvdXJjZS4NCk1vc3Qgb2YgdGhlIGRpc2N1c3Npb24gaGFzIGhhcHBl
bmVkIGluIGNvZGUgcmV2aWV3cyAob24gZ2Vycml0KSBhbmQgaW4gZGlzY29yZCBpbiB0aGUgI2Jt
Y3dlYi1hbmQtcmVkZmlzaCBjaGFubmVsLiAgWW91IG1pZ2h0IGNoZWNrIHRob3NlIG91dCBmb3Ig
bW9yZSB1cCB0byB0aGUgbWludXRlIGluZm9ybWF0aW9uIG9uIHdoYXQgdGhlIHBsYW4gaXMgaGVy
ZSwgYnV0IHRoZSBUTDsgRFIgaXMgdGhhdCB0aG9zZSBJRHMgbmVlZCB0byBjaGFuZ2UsIGFzIHRo
ZSByZWRmaXNoIHNwZWMgYWxsb3dzIHVzIHRvIGRvLg0KDQo+DQo+DQo+DQo+IEluIHN1bW1hcnks
IGRvZXMgT3BlbkJNQyBzcGVjaWZ5IHRoZXNlIHJlc291cmNlIG5hbWVzIGFzIHBhcnQgb2YgdGhl
aXIgc3BlYywgb3IgZG9lcyBpdCByZWZlciB0byBleGlzdGluZyBETVRGIFJlZGZpc2ggc2NoZW1h
IHNwZWNzPw0KDQpLaW5kYSB0aGUgbGF0ZXIsIHRoZSB0aGUgUmVkZmlzaCBzcGVjcyBzYXkgdGhh
dCB0aGlzIGlzIGFuIG9wYXF1ZSBmaWVsZCwgYW5kIHRoZSBjbGllbnQgc2hvdWxkIG5vdCBiZSB1
c2luZyBpdCBmb3IgcmVzb3VyY2UgaWRlbnRpZmljYXRpb24gaWYgeW91IHdhbnQgdG8gYmUgY29t
cGF0aWJsZSB3aXRoIG1vcmUgdGhhbiBqdXN0IG9uZSBzeXN0ZW0sIHdoaWNoIGlkZWFsbHkgZXZl
cnkgY2xpZW50IHNob3VsZCBhdCBsZWFzdCB0cnkgdG8gZG8gKHBsZWFzZSBkb24ndCBoYXJkY29k
ZSBvcGVuYm1jLXNwZWNpZmljIGFzc3VtcHRpb25zIGluIHlvdXIgcmVkZmlzaCBjbGllbnQpLg0K
DQotRWQNCg0KPg0KPg0KPg0KPiBUaGFuayB5b3UhDQo+DQo+DQo+DQo+IEplZmYgRnJpZWRtYW4N
Cj4gU3IuIEZpZWxkIFN5c3RlbXMgRW5naW5lZXIgfCBaVCBTeXN0ZW1zDQo+DQo+IE06IDIwNi44
MTkuMjgyNA0KPg0KPg0KPg0KPiBUaGlzIGVtYWlsIGFuZCBhbnkgZmlsZXMgdHJhbnNtaXR0ZWQg
d2l0aCBpdCBhcmUgcHJpdmlsZWdlZC9jb25maWRlbnRpYWwgYW5kIGludGVuZGVkIHNvbGVseSBm
b3IgdGhlIHVzZSBvZiB0aGUgaW5kaXZpZHVhbCB0byB3aG9tIHRoZXkgYXJlIGFkZHJlc3NlZC4g
SWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlbWFpbCBpbiBlcnJvciwgeW91IGFyZSBub3QgYXV0
aG9yaXplZCB0byBkaXN0cmlidXRlIGl0IGluIHdob2xlIG9yIGluIHBhcnQuIFRoaXMgY29tbXVu
aWNhdGlvbiBkb2VzIG5vdCBjb25zdGl0dXRlIGEgY29udHJhY3Qgb2ZmZXIsIGFtZW5kbWVudCwg
b3IgYWNjZXB0YW5jZSBvZiBhIGNvbnRyYWN0IG9mZmVyLCB1bmxlc3MgZXhwbGljaXRseSBzdGF0
ZWQuDQo+DQo+DQoNCg==

