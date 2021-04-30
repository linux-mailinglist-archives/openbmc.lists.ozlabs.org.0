Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E290136FDB1
	for <lists+openbmc@lfdr.de>; Fri, 30 Apr 2021 17:24:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWx4Q6fjcz2yxq
	for <lists+openbmc@lfdr.de>; Sat,  1 May 2021 01:24:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=sWw+Lxm/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::331;
 helo=mail-wm1-x331.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=sWw+Lxm/; dkim-atps=neutral
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWx4D0RBSz2yhf
 for <openbmc@lists.ozlabs.org>; Sat,  1 May 2021 01:24:25 +1000 (AEST)
Received: by mail-wm1-x331.google.com with SMTP id
 f15-20020a05600c4e8fb029013f5599b8a9so1926464wmq.1
 for <openbmc@lists.ozlabs.org>; Fri, 30 Apr 2021 08:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1dNghZu+rcIdY7qCFVOtNKfm30XzTTeJ/vBF5ANhJnw=;
 b=sWw+Lxm/CGGpPlMOiriklpoCj7lOynqH4wf8dKV4FFESxJxMSYjv1PWfRs7c4LNzmY
 j3nz57ZLPZAbRx5XvFV+jZ5ZGgMx03/FL+obj5mGAp1x00p2o3iG1e+KgKYdseHJwBZA
 iaOq1H4HL4UUPsyA6AV37LxdKu0nreDG3O0m73OsutWNbHYLSs+w89ePzufeZADbO7ul
 QMIu4Hay2oR9OgdqXY9vQTD17+aPo8AXmNueUUs/PmOBsIS6eGRdDq6MfvDcW8YBCRHh
 N1DrTliG01TKQXxipvVAr/sylfzYmSfHOnh2XYipc6B1loOEp2tHWCWBqjGNKgNU9y07
 Sx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1dNghZu+rcIdY7qCFVOtNKfm30XzTTeJ/vBF5ANhJnw=;
 b=KqXipiKrQFCdVs9UK9UWxEY0hdTYTZMu+nRVYmiZ27uznvxO36dTDwM69mKzThmz5k
 EfaLjLpyxY64HFH5mxaafWzvHPd9KTblEUTSVd4SibnScbW2b0kbUo87VyzPg2dNXJjh
 4pJGveXcUHMDWfU7uIhDxF9kKYzsIx+bWboTINng//92uIWSS7DWG1IKgwfJyNWbbh67
 Kr1XwSQBrS6pEhQlrPaMWFmelq8kaa6Lez/T8vELuJEeVYlSWVaZ4kn7szd4J1FRFhb+
 swiIjt0g1kOMikS5Uq+aff7t4EG/4bqW39raryQb0IdjzxaxhfmUOfYe8SbtH5YaflWH
 omnw==
X-Gm-Message-State: AOAM530xNfw29iIBouH6u+Y1nnUiM01Nwe3HVYGp58dkCKJkIIC33Gxw
 OQfA5/cH+fL2ysLXZEipBSPfByLcEgD5cZmzx6rK4A==
X-Google-Smtp-Source: ABdhPJxBEO3kId5hAtyUhxNew8vEGkK4qmYpiWJKKhe8ef9I/eOaJxQkeT4GTPq9JFRFulWdrfmE9JtYPVDZefDfkrA=
X-Received: by 2002:a1c:1f4f:: with SMTP id f76mr6776880wmf.14.1619796258987; 
 Fri, 30 Apr 2021 08:24:18 -0700 (PDT)
MIME-Version: 1.0
References: <SG2PR04MB3093D4832CB9DFE036DAA41DE15E9@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <YIwPtU8g5PhkLC6k@heinlein>
 <SL2PR04MB3097C0CCB579F0B2C2DBA0BFE15E9@SL2PR04MB3097.apcprd04.prod.outlook.com>
In-Reply-To: <SL2PR04MB3097C0CCB579F0B2C2DBA0BFE15E9@SL2PR04MB3097.apcprd04.prod.outlook.com>
From: Ed Tanous <edtanous@google.com>
Date: Fri, 30 Apr 2021 08:24:07 -0700
Message-ID: <CAH2-KxA7yccRHOKbmzeKxXZfgcocd6WzfP0q-xrmsECZg=c4Ug@mail.gmail.com>
Subject: Re: Issue in displaying hardware name using Redfish
To: Jayashree D <jayashree-d@hcl.com>
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

On Fri, Apr 30, 2021 at 7:26 AM Jayashree D <jayashree-d@hcl.com> wrote:
>
> Classification: Confidential
>
> Thanks Patrick, I will follow this issue in that sdbusplus.
>
> -----Original Message-----
> From: Patrick Williams <patrick@stwcx.xyz>
> Sent: Friday, April 30, 2021 7:40 PM
> To: Jayashree D <jayashree-d@hcl.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: Issue in displaying hardware name using Redfish
>
> On Fri, Apr 30, 2021 at 07:14:19AM +0000, Jayashree D wrote:
> > I am using Redfish commands to verify the details of sensor and hardwar=
e.
> > But I am getting the hardware name as "TiogaPass\ufffdseboard" instead =
of "TiogaPass_Baseboard".
>
> There is a github issue open tracking this and Ed is working on it.

The fix is here;  I believe it's just waiting on the maintainer;

https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/42512

>
> https://github.com/openbmc/sdbusplus/issues/60
>
> --
> Patrick Williams
> ::DISCLAIMER::
> ________________________________
> The contents of this e-mail and any attachment(s) are confidential and in=
tended for the named recipient(s) only. E-mail transmission is not guarante=
ed to be secure or error-free as information could be intercepted, corrupte=
d, lost, destroyed, arrive late or incomplete, or may contain viruses in tr=
ansmission. The e mail and its contents (with or without referred errors) s=
hall therefore not attach any liability on the originator or HCL or its aff=
iliates. Views or opinions, if any, presented in this email are solely thos=
e of the author and may not necessarily reflect the views or opinions of HC=
L or its affiliates. Any form of reproduction, dissemination, copying, disc=
losure, modification, distribution and / or publication of this message wit=
hout the prior written consent of authorized representative of HCL is stric=
tly prohibited. If you have received this email in error please delete it a=
nd notify the sender immediately. Before opening any email and/or attachmen=
ts, please check them for viruses and other defects.
> ________________________________
