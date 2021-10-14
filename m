Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9B642E1DB
	for <lists+openbmc@lfdr.de>; Thu, 14 Oct 2021 21:12:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVfDZ3bGTz306R
	for <lists+openbmc@lfdr.de>; Fri, 15 Oct 2021 06:12:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oodsm5cI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c31;
 helo=mail-oo1-xc31.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=oodsm5cI; dkim-atps=neutral
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVfDB0KrHz2ypg
 for <openbmc@lists.ozlabs.org>; Fri, 15 Oct 2021 06:12:25 +1100 (AEDT)
Received: by mail-oo1-xc31.google.com with SMTP id
 c29-20020a4ad21d000000b002b6cf3f9aceso2197298oos.13
 for <openbmc@lists.ozlabs.org>; Thu, 14 Oct 2021 12:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=jfStpkkgYKalW/HbcZMksIsgwLhINNrWX5MsIGVtdCc=;
 b=oodsm5cI0pFv8l/d6cZx5PPO9PzrYS6OMnqjnlOJEIPhWxAqy9Y0n2XFMnf+R51jmo
 k0HUVniv5rA/Fto2zf7x47FJkWqmecAtrBA1jgUTWOmjjNWRukufRtn4ieSrXfBYja6C
 3kI0xpNf4JyKUb/NDfmrRde+tgBA6qC4QENcf001I/MWBNVW+NzuWj1vP6XZ/H32vJPQ
 +BBbzGh+Xpd0kuQOMA9WkB2wjglW9vfune6TvajqnKhfHq2PCzpaSV2RBZfOLU9l0y9U
 1+lMS1KhYHXqHJDIxFSmyi77W79ScKlFrULZCxg3nyxVkou2PjCJa8Pxhdd5uo2rkDLp
 Y9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=jfStpkkgYKalW/HbcZMksIsgwLhINNrWX5MsIGVtdCc=;
 b=P8F3GlyjSvlWnzA+jxL8zzRuUV3UPg1ZWN6UjvIt6lHIT03bczsNSA3i0XGyjdjVxT
 AAw1ydsdxmJoD9ZykhJ1vFHnEzCkpB/PVNO5F6f4yuaIoWrhopiR0Ar9c0mVjnwww9SE
 rdAE9Jy8swNVWCATuAEntCeq/n+Ly+zyrRTlaIpGSxNyyOtGkhr1yHzkGXs4Qf0x3/pS
 ZvuTW2wskpexxfLAN1cJGNqvkjbkVB7J/EgizYNvyM8O2IdfwnJB0eqv3iMRms7sevuW
 yu7fWk7NE8+M0SbgpcPtSAuYpw46GAxW5PgwPjZ2W8+s30r7GOh15rDlFh5afXS+Z9f/
 +nMw==
X-Gm-Message-State: AOAM530AIJGuLqZP0xCSV4S63wwct9641hZqN3UUumNfRtJiMkF3170w
 BI6OU+oZ9S9SHnNsbxvpT1yzDh7bwEvODg==
X-Google-Smtp-Source: ABdhPJyWo9zv75T4OXzugMiBjaAu9EK1Mlskwz7fGnjpfGtK0P1hxt2jqxvZMcKM8WyLYRpYTDM9mw==
X-Received: by 2002:a4a:3c07:: with SMTP id d7mr5552610ooa.84.1634238741692;
 Thu, 14 Oct 2021 12:12:21 -0700 (PDT)
Received: from smtpclient.apple ([2600:1700:19e0:3310:31d4:1a6:d849:959e])
 by smtp.gmail.com with ESMTPSA id g12sm611741oof.6.2021.10.14.12.12.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Oct 2021 12:12:21 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: Start using github security advisories
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <62b15edd-110a-3574-66c5-d11299bbd38c@linux.ibm.com>
Date: Thu, 14 Oct 2021 14:12:20 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <67C8A5BA-9FD5-4804-B5CA-C2687FC17889@gmail.com>
References: <62b15edd-110a-3574-66c5-d11299bbd38c@linux.ibm.com>
To: Joseph Reynolds <jrey@linux.ibm.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> Per today's Security working group meeting, we want to start using =
[GitHub security advisories][].  I think we need someone with admin =
permissions to github.com/openbmc/openbmc to create new advisories. Then =
we'll want a group (team? perhaps security-response-team) with the =
current OpenBMC [security response team][] members.  (I have that list.)

Looks like you=E2=80=99ll need admin authority on openbmc/openbmc in =
order to utilize the security advisories feature. I wonder if it=E2=80=99s=
 better to create a openbmc/security repo and we can give you and the =
security team admin of that repo for this work? This would also provide =
a potential location to track github issues for the security team.



> On Oct 13, 2021, at 3:56 PM, Joseph Reynolds <jrey@linux.ibm.com> =
wrote:
>=20
>=20
> Per today's Security working group meeting, we want to start using =
[GitHub security advisories][].  I think we need someone with admin =
permissions to github.com/openbmc/openbmc to create new advisories. Then =
we'll want a group (team? perhaps security-response-team) with the =
current OpenBMC [security response team][] members.  (I have that list.)
>=20
> How do we get started?  Who has admin authority?
>=20
> Joseph
>=20
>=20
> [GitHub security advisories]: =
https://docs.github.com/en/code-security/security-advisories/about-github-=
security-advisories
> [security response team]: =
https://github.com/openbmc/docs/blob/master/security/obmc-security-respons=
e-team-guidelines.md
>=20

