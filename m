Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F71C3FCC30
	for <lists+openbmc@lfdr.de>; Tue, 31 Aug 2021 19:18:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GzYnG6QhLz2yK3
	for <lists+openbmc@lfdr.de>; Wed,  1 Sep 2021 03:18:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=ngUSV4LO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32a;
 helo=mail-wm1-x32a.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=ngUSV4LO; dkim-atps=neutral
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GzYmp3jDdz2yHw
 for <openbmc@lists.ozlabs.org>; Wed,  1 Sep 2021 03:18:16 +1000 (AEST)
Received: by mail-wm1-x32a.google.com with SMTP id g138so11751826wmg.4
 for <openbmc@lists.ozlabs.org>; Tue, 31 Aug 2021 10:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TcUSpFfDVAAlEkWgJKf2aOQa/qikYOpEsjsDB388ivI=;
 b=ngUSV4LOqCp71LTyfQRfLlncVipP4nULtiTN5HpslRUh5kr5FWtDI80ePQiMJ+Oh7n
 nO9WSZybw+/HJwpW5MSJU5kFLU8gShpKREPNwHgSsxoWG9YOB6GejAKPm6HJ/83ZrJ8R
 KIZ+SbtHYC+3YmzjhZxbNI7VoScq2YliRbli98LiaspX2zuzzAqr2dOqDB3l5UjNqbhK
 vEg9PZNW70xa3OBuF3E3T98wEXb+8Q/PcTYki+UA+FSbH2MWANSpuV+V9ZXeRVFX0knE
 ADG5KJjXb3HnPvCNP7lP+C4/eDMidAfY7kN+jEAD/KZXMpjx7U5FkfwUMN2D9VLtt/gl
 az+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TcUSpFfDVAAlEkWgJKf2aOQa/qikYOpEsjsDB388ivI=;
 b=MNz8D0uILEvfPNujn+UL+RWoXaJ+b18wonQfn3WngyOCqubHArfD+eyEAb/4JR0kk5
 DqHXNpl/m/NAwAs5icHAnEikzerpS0Zyeg4coW1BeQ0PwtP7O1mtIZ1RGicjHorwnjcy
 pls0Zb0N8LGZF7WFhW6fXXFP9Tb05QwdUxE2VbW9+ZlakoN0gve1kmmn97vAOIibcMPl
 OPLJK2JbeRteiHDYg9fOuagJMbd133PmucRHOZjH/FSl1PljRss5Yp8kR2H0vECPH5MM
 MfqiA1tC1TnuhUw3ct/BGl/543+KSSkZV6fz6sestAZPAi2Yz2r8KzdXJkDAZsG8MLQq
 mcSw==
X-Gm-Message-State: AOAM5303DsaLHaewzqFJrxYzptuiYdSP2rALOvO0wO5v5To+en3UPL8R
 zfOicqaHWZDkftn1tQcYiLUdkfHIGuRR38qluXzNd9x70n8XvQ==
X-Google-Smtp-Source: ABdhPJwahPyWgTs1/gn6TYM6Z/mWlnjwnH3QfXn1TtzTWN4MImnOWXs6zAW7Vn/u0C//8vbcba25KeB+EygkCpWpzQA=
X-Received: by 2002:a1c:c903:: with SMTP id f3mr5383749wmb.101.1630430288755; 
 Tue, 31 Aug 2021 10:18:08 -0700 (PDT)
MIME-Version: 1.0
References: <DM5PR11MB1547951F649CFEEEE6188058E2CC9@DM5PR11MB1547.namprd11.prod.outlook.com>
In-Reply-To: <DM5PR11MB1547951F649CFEEEE6188058E2CC9@DM5PR11MB1547.namprd11.prod.outlook.com>
From: Ed Tanous <edtanous@google.com>
Date: Tue, 31 Aug 2021 10:17:57 -0700
Message-ID: <CAH2-KxBV8AaW0aftJDOB2z75HyQXEV1ct6gbR-BYS90VWd=7AA@mail.gmail.com>
Subject: Re: OpenBmc Redfish support etag property error
To: "Zhang, ShuoX" <shuox.zhang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Aug 31, 2021 at 1:11 AM Zhang, ShuoX <shuox.zhang@intel.com> wrote:
>
> hi,
>
>               Etag is to check whether the json string returned by the se=
rver has changed ,  I plan to use MD5 encryption to generate etag , can=E2=
=80=99t  find etag in http request header.

That's because we don't currently implement etag.  If you're looking
at adding it, keep in mind, implementation of etag is more than simply
including the header, and likely has some changes that would need to
be made to the internals of the system.

PS, MD5 hasn't really been acceptable for hashing algorithms for a
while now.  Please research what the current guidance is on what hash
to use for this;  I suspect the guidance is still sha256.

>
>
>
>               Here are the steps I tested:
>
>               1,  I used postman to send the first request to a URL, and =
 added the etag property to the header of the response use hard code , then=
 http connection function async_write respond  header  buffer
>
>               2,  Request the same url, read the header of the request, n=
o etag can be found.
>
>
>
>               Here are some logs:
>
>
>
> Respond:
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]: (2021-01-11 23:45:25) [DEBUG "htt=
p_connection.hpp":683] 0x1a3e4c8 doWrite
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]: zs_debug res result : 200
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]:  field : Strict-Transport-Securit=
y , /text: Strict-Transport-Security ,Value: max-age=3D315
>
> 36000; includeSubdomains; preload
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]:  field : X-Frame-Options , /text:=
 X-Frame-Options ,Value: DENY
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]:  field : Pragma , /text: Pragma ,=
Value: no-cache
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]:  field : Cache-Control , /text: C=
ache-Control ,Value: no-Store,no-Cache
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]:  field : <unknown-field> , /text:=
 X-XSS-Protection ,Value: 1; mode=3Dblock
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]:  field : <unknown-field> , /text:=
 X-Content-Type-Options ,Value: nosniff
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]:  field : <unknown-field> , /text:=
 Content-Security-Policy ,Value: default-src 'none'; img
>
> -src 'self' data:; font-src 'self'; style-src 'self'; script-src 'self'; =
connect-src 'self' wss:
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]:  field : Content-Type , /text: Co=
ntent-Type ,Value: application/json
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]:  field : ETag , /text: ETag ,Valu=
e: ba2e34ec8c7d9168cc2bf880a1674ae4
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]:  field : Content-Length , /text: =
Content-Length ,Value: 525
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]: zs_debug response: {
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]:   "@odata.id": "/redfish/v1/Certi=
ficateService/CertificateLocations",
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]:   "@odata.type": "#CertificateLoc=
ations.v1_0_0.CertificateLocations",
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]:   "Description": "Defines a resou=
rce that an administrator can use in order to locate all
>
> certificates installed on a given service",
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]:   "Id": "CertificateLocations",
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]:   "Links": {
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]:     "Certificates": [
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]:       {
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]:         "@odata.id": "/redfish/v1=
/Managers/bmc/NetworkProtocol/HTTPS/Certificates/1"
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]:       }
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]:     ],
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]:     Certificates@odata.count: 1
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]:   },
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]:   "Name": "Certificate Locations"
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]: }
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]: (2021-01-11 23:45:25) [DEBUG "htt=
p_connection.hpp":698] 0x1a3e4c8 async_write 997 bytes
>
>
>
> Second Request:
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]: (2021-01-11 23:45:25) [DEBUG "htt=
p_connection.hpp":511] 0x1a3e4c8 doReadHeaders
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]: zs_debug read http_head :GET /red=
fish/v1/CertificateService/CertificateLocations HTTP/1.1
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]: Authorization: Basic cm9vdDowcGVu=
Qm1j
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]: User-Agent: PostmanRuntime/7.28.4
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]: Accept: */*
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]: Cache-Control: no-cache
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]: Postman-Token: 1981d43c-7067-4959=
-a853-dd7f93bb04fa
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]: Host: 10.239.138.19
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]: Accept-Encoding: gzip, deflate, b=
r
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]: Connection: keep-alive
>
> Jan 11 23:45:25 intel-obmc bmcweb[361]:
