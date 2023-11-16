Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C457EE33D
	for <lists+openbmc@lfdr.de>; Thu, 16 Nov 2023 15:47:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jgbD6I1W;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SWND128wdz3d8t
	for <lists+openbmc@lfdr.de>; Fri, 17 Nov 2023 01:47:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jgbD6I1W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SWNCS1BtPz2yVG
	for <openbmc@lists.ozlabs.org>; Fri, 17 Nov 2023 01:46:42 +1100 (AEDT)
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6d2efe8c43eso970328a34.0
        for <openbmc@lists.ozlabs.org>; Thu, 16 Nov 2023 06:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700145999; x=1700750799; darn=lists.ozlabs.org;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gk9ErOLN+8bsg+iTJ9yZOtzl3BVPrgtc+eE2RxEZdVE=;
        b=jgbD6I1WMQ34gkdQ2t/+fbFsHcZeqHzdDtPR6sOsF0YepvrY8RkH9Ew8L8rZprMuFt
         mscdBSuh76URsN9/iZT9xvSOlPElmW4dMZe4zd9fdJafo2PcGJXCirbDR4SNbeF2Ttex
         9WfJZ2IOMYTnI9UcQJApdNj00iU2GWESY7l7W8vM3WxwtQfXedKIQQE9Uvv6UIU9eKeR
         c0uzRour/LoS+ng3GIWkRC22Qw3Ph8fSMMWvRiVduIa5weprAo6bCrDrUYxi46tEouEz
         MElgE2Juo1cG8b8GbzdX+mKiZIlram/FJFtwNAywNr2kdiH8rz5aSA2TK+Ht82TisE2w
         Wo6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700145999; x=1700750799;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gk9ErOLN+8bsg+iTJ9yZOtzl3BVPrgtc+eE2RxEZdVE=;
        b=fRQdJ3REnnHmv7TZqNP5mHmZYY15WOQBb9CYYvcjIslpJVbb8h2aWrplc3HKcq2OMg
         5LApivuHtoEx5sdvG3D9DiGVeD+ZQctwP0o27PyH+tYNaXofWQcY9DQc+PPqZff6TOxi
         0eGQeeZxay2JuZBgk2rhJXcrC8CmKnUz6DfDqwWftBXlSm8eOhGKOCb/mwQdNK6WcBhy
         jnjFYRrDWWKXnT749bvcmr0oAaDUnfG9ny8FyOX2NiEpIhGZMjqKeoLiUhqJOVzzaBV7
         2tjYtrekn1LFCY+Vy9C9KP8nYLN6LYUa60MbxQHp0e1LCU/SccixuGVQWEauazATJdL4
         MZ3Q==
X-Gm-Message-State: AOJu0Yy0p/UwpTcWvr13TVlXBH+wn1t/9p0O0dNKrrCcrZalIH9Yf/do
	eSm+SwCByC0dqnjgJt+CtzM=
X-Google-Smtp-Source: AGHT+IEeuMmhe3KDTsbTFBRn1RvUza+Ts664BcpUXZvOMzyLkN1kRl6DcXKXn4rtryviD4s+I6uIuA==
X-Received: by 2002:a9d:6e89:0:b0:6d4:80b4:bef2 with SMTP id a9-20020a9d6e89000000b006d480b4bef2mr894495otr.16.1700145998961;
        Thu, 16 Nov 2023 06:46:38 -0800 (PST)
Received: from smtpclient.apple ([2605:a601:aa7e:6100:2ca0:232e:5a78:fcbc])
        by smtp.gmail.com with ESMTPSA id q21-20020a9d6655000000b006b8e8884f2fsm916242otm.51.2023.11.16.06.46.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Nov 2023 06:46:38 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Message-Id: <01C3FAAD-B348-4D95-BC44-E75AFF49C62F@gmail.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_13C86F75-F675-471E-B2A4-9221E5301BDF"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Re: AMD's Signed CCLA
Date: Thu, 16 Nov 2023 08:46:27 -0600
In-Reply-To: <SN6PR12MB475206476ACD211F5FE8E9A396B1A@SN6PR12MB4752.namprd12.prod.outlook.com>
To: "Venkatesh, Supreeth" <Supreeth.Venkatesh@amd.com>
References: <SN1PR12MB25428FA4CD525DF87AC73F8496830@SN1PR12MB2542.namprd12.prod.outlook.com>
 <SN6PR12MB4752077B3255E94D865769EE96739@SN6PR12MB4752.namprd12.prod.outlook.com>
 <3a78e200967593b319b107c3a31744fd0dbe0bde.camel@fuzziesquirrel.com>
 <SN6PR12MB475206476ACD211F5FE8E9A396B1A@SN6PR12MB4752.namprd12.prod.outlook.com>
X-Mailer: Apple Mail (2.3774.200.91.1.1)
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
Cc: "manager@lfprojects.org" <manager@lfprojects.org>, "Kumar, Ashok2" <Ashok2.Kumar@amd.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Rathinasabapathi, Rajaganesh" <Rajaganesh.Rathinasabapathi@amd.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>, "Stephens, Christie" <Christie.Stephens@amd.com>, "Othayoth, Jayanth" <Jayanth.Othayoth@amd.com>, "Dhandapani, Abinaya" <Abinaya.Dhandapani@amd.com>, "Dolaty, Mohsen" <Mohsen.Dolaty@amd.com>, "Kurapati, Mahesh" <Mahesh.Kurapati@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_13C86F75-F675-471E-B2A4-9221E5301BDF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Nov 15, 2023, at 1:57=E2=80=AFPM, Venkatesh, Supreeth =
<Supreeth.Venkatesh@amd.com> wrote:
>=20
> [AMD Official Use Only - General]
>=20
> Please find the updated Schedule A attached.
> Updated CCLA necessitated because of both CLA Manager change and =
Schedule A change.

Hi Supreeth,

CCLA accepted and gerrit group updated with everyone on the CLA who has =
logged into gerrit.
=
https://gerrit.openbmc.org/admin/groups/b6f229c0f3e9a11b814e6ccf56281d4064=
d4da4e,members

Andrew

>=20
>=20
> -----Original Message-----
> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
> Sent: Thursday, August 25, 2022 8:06 AM
> To: Venkatesh, Supreeth <Supreeth.Venkatesh@amd.com>; =
'openbmc@lists.ozlabs.org' <openbmc@lists.ozlabs.org>; =
'manager@lfprojects.org' <manager@lfprojects.org>
> Cc: Spottswood, Jason <Jason.Spottswood@amd.com>
> Subject: Re: AMD's Signed CCLA
>=20
> [CAUTION: External Email]
>=20
> On Wed, 2022-08-24 at 19:25 +0000, Venkatesh, Supreeth wrote:
>> [AMD Official Use Only - General]
>>=20
>> Please find the updated signed CCLA from AMD attached.
>> Updated CCLA necessitated because of both CLA Manager change and
>> Schedule A change.
>=20
> Hi Supreeth
>=20
> CCLA accepted.
>=20
> Thanks,
> Brad
> <OpenBMC.CCLA_ScheduleA_update11_15_2023.pdf>


--Apple-Mail=_13C86F75-F675-471E-B2A4-9221E5301BDF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;"><br =
id=3D"lineBreakAtBeginningOfMessage"><div><br><blockquote =
type=3D"cite"><div>On Nov 15, 2023, at 1:57=E2=80=AFPM, Venkatesh, =
Supreeth &lt;Supreeth.Venkatesh@amd.com&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div><div>[AMD Official Use Only - =
General]<br><br>Please find the updated Schedule A attached.<br>Updated =
CCLA necessitated because of both CLA Manager change and Schedule A =
change.<br></div></div></blockquote><div><br></div><div>Hi =
Supreeth,</div><div><br></div><div>CCLA accepted and gerrit group =
updated with everyone on the CLA who has logged into =
gerrit.</div><div><div style=3D"display: block;"><a =
href=3D"https://gerrit.openbmc.org/admin/groups/b6f229c0f3e9a11b814e6ccf56=
281d4064d4da4e,members">https://gerrit.openbmc.org/admin/groups/b6f229c0f3=
e9a11b814e6ccf56281d4064d4da4e,members</a></div><div style=3D"display: =
block;"><br></div><div style=3D"display: =
block;">Andrew</div></div><br><blockquote =
type=3D"cite"><div><div><br><br>-----Original Message-----<br>From: Brad =
Bishop &lt;bradleyb@fuzziesquirrel.com&gt;<br>Sent: Thursday, August 25, =
2022 8:06 AM<br>To: Venkatesh, Supreeth =
&lt;Supreeth.Venkatesh@amd.com&gt;; 'openbmc@lists.ozlabs.org' =
&lt;openbmc@lists.ozlabs.org&gt;; 'manager@lfprojects.org' =
&lt;manager@lfprojects.org&gt;<br>Cc: Spottswood, Jason =
&lt;Jason.Spottswood@amd.com&gt;<br>Subject: Re: AMD's Signed =
CCLA<br><br>[CAUTION: External Email]<br><br>On Wed, 2022-08-24 at 19:25 =
+0000, Venkatesh, Supreeth wrote:<br><blockquote type=3D"cite">[AMD =
Official Use Only - General]<br><br>Please find the updated signed CCLA =
from AMD attached.<br>Updated CCLA necessitated because of both CLA =
Manager change and<br>Schedule A change.<br></blockquote><br>Hi =
Supreeth<br><br>CCLA accepted.<br><br>Thanks,<br>Brad<br><span =
id=3D"cid:0D43F06A-EB6F-4AAE-A962-6455E9ED9EC7">&lt;OpenBMC.CCLA_ScheduleA=
_update11_15_2023.pdf&gt;</span></div></div></blockquote></div><br></body>=
</html>=

--Apple-Mail=_13C86F75-F675-471E-B2A4-9221E5301BDF--
