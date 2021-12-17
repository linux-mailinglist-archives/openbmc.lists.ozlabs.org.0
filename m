Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49607478CA9
	for <lists+openbmc@lfdr.de>; Fri, 17 Dec 2021 14:48:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFr0j0y1Dz3cRD
	for <lists+openbmc@lfdr.de>; Sat, 18 Dec 2021 00:48:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CnKu/28q;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22c;
 helo=mail-oi1-x22c.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=CnKu/28q; dkim-atps=neutral
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFr0H56VZz3bgl
 for <openbmc@lists.ozlabs.org>; Sat, 18 Dec 2021 00:47:57 +1100 (AEDT)
Received: by mail-oi1-x22c.google.com with SMTP id m6so3674274oim.2
 for <openbmc@lists.ozlabs.org>; Fri, 17 Dec 2021 05:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=QTpkvWhK1RHNofq4p4NwelMA0vLWRRKXV6bKhTZNSVo=;
 b=CnKu/28q3Zb+y1OMVRAFAsjCkR2Zj+tRtagbvnKeb4YK6x/wGpxEryxpC5ihHPvy/0
 emzL+Xkl7cAaPjDQBecAYSnz1mpbl9CGaGtKZgYGqoCQWukyioVrY/xLs/MZ4KkfwWno
 joj3vTPhU4La1DVUlqNLbiN3ikahzqv1tNjb/MONdwPRIBZsaonupNJsMa9k5S6Jikgv
 qQK6ekKMW424ue6cuFV1za+D0PMzQ3f++EZLDMvt2khWBGGWgJq43yFLuFUkI1U2VuDK
 HcsoUrwTW11rVyJGYq7ZnJ/RrR/08WPUIGMFhCUaNEsa9aTEjhLtl0PWNlbhudEAyilw
 Eh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=QTpkvWhK1RHNofq4p4NwelMA0vLWRRKXV6bKhTZNSVo=;
 b=0/W2/oIABtwGdTWLhNdz+uJ8IGO6rZ8cDMVAfWDRISSZn1I5iYLmbtgI+qhrgAKuwi
 obm/Dt9xUnT/0haHj1DvHbGEgVifrz/oFy7ZqHitlL0KO7WbDnucXAUl55Rao/FbOV+w
 XRqwv4EBIhnH1X0eI3OKWnSbt6utY8YgDqKkPoyBqCwFhpPhlevVMJ9ZCK/Y24HEzrvF
 g6171c9x0tPNo1DmOCFrQX3O9tWWsWqBBS+X7HvSUw2MN/W+ctfnxVkhy2ZaQ8Be9iot
 cwaVNPb+oPfGEtIYrU5i/O9IOOrDzFdXMqGIsdFJn6/39dC5O9PSzY4GRvQ/dlwc3Vl1
 rylg==
X-Gm-Message-State: AOAM532N/Ue8xA8fs2zHLFJjg2Af5os7B5WoAOyRT3anI1HVYdW0cYFn
 AhW22P38RehHKyDW/s9Lf/Ibuc7v2y0=
X-Google-Smtp-Source: ABdhPJyrkqs+/mMswsImQMenFRGbya65JeEOSDe0afSC+TOJokD/KHGd8IlKrjqPI/hzb2TkPO/eWQ==
X-Received: by 2002:a05:6808:5c1:: with SMTP id
 d1mr7873672oij.141.1639748874339; 
 Fri, 17 Dec 2021 05:47:54 -0800 (PST)
Received: from smtpclient.apple ([2600:1700:19e0:3310:44bf:a01e:e6e2:9603])
 by smtp.gmail.com with ESMTPSA id o26sm1615578otj.14.2021.12.17.05.47.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 Dec 2021 05:47:54 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: Enable Bletchley in Jenkins.
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <Ybt5BZg/vjRWfp3W@heinlein>
Date: Fri, 17 Dec 2021 07:47:53 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <A9594556-70A2-4BAC-A31D-AC83A3090188@gmail.com>
References: <Ybt5BZg/vjRWfp3W@heinlein>
To: Patrick Williams <patrick@stwcx.xyz>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Dec 16, 2021, at 11:36 AM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> Andrew,
>=20
> Can we get the machine 'bletchley' enabled in CI?  Facebook is doing =
some fairly
> active development on it and I'd like to keep tabs on build =
regressions.  We
> currently contribute 4 cloud instances to the Jenkins pool and have 3 =
machine
> types.  Let me know if we need to enable any additional compute =
resources.

Seems reasonable to me, I added bletchley to CI.

>=20
> --=20
> Patrick Williams

