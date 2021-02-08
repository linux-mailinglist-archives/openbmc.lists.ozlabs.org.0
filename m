Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDC2314143
	for <lists+openbmc@lfdr.de>; Mon,  8 Feb 2021 22:07:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZJWR6qDwzDrgP
	for <lists+openbmc@lfdr.de>; Tue,  9 Feb 2021 08:07:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32f;
 helo=mail-ot1-x32f.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZgQigFEe; dkim-atps=neutral
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZJVh0hpWzDvW4
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2021 08:06:49 +1100 (AEDT)
Received: by mail-ot1-x32f.google.com with SMTP id l23so3872678otn.10
 for <openbmc@lists.ozlabs.org>; Mon, 08 Feb 2021 13:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=1mF8a0f1IQJDlsSpL0S8b49OJtbM7c6SqE0FAeJ/tyk=;
 b=ZgQigFEeyMF6RPHzfFj/q4tFdsIH1eCdVeOjItmLGI6bKqjg/FvjgC19/n0mK++37n
 Q/1TDj+EsXTNVE1DsSHXcggA6mwYGGhMUPuW6lY/sAUJ9k4zCp5efvOeZCdTVeGC0BP4
 tFxFxXHTbiE+i9L3h8f99pk4NKs/sTA/W4YwdJZLROJnHNtwcZcz4S+F2aUoiAYBP0BN
 2KOjAWakEEGbtPLzRDtnQzYZAcH8ISdtZh/g/H7qSoAsWP14vUs+mrWj/XiE4SfP9/RV
 w8PlukBIX+bdS9CSImrR8KzdkR8liGnJXu5N/jpAoeEZqvZK1E8AhSWeRAQlVo1qW22g
 E7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=1mF8a0f1IQJDlsSpL0S8b49OJtbM7c6SqE0FAeJ/tyk=;
 b=tY+KYqJxJMgT7U7imxv54QxkTjxZGT1gCea3kUt8sdRo5lhUsLnqlxlmzx1JAHqTF9
 8AGBNx1hgAe2w34IUFulTm1RrkNgeHP8qYOtd7U6UDghdRPjflAxORKvPBP24FIIhYjG
 bau/XYF7YmyS7JNelUO6zwgtVmnF1MWmJ2fLiteiSj6Sgc9gix5v0Np4rhOSh84sfoOx
 NF8zQ/zRX4GQ/QrTudPsDgirOfsrpc1GNRR5NYFuWl0COo+OFmaaVerGfJBr5bpTEPQw
 PBGp7KDIg0TrA3ciFC4yvh0zjSrIe8082QxhjuOsyM/UpGmUfVbU3g0k2vcDCUkECb8P
 DDEg==
X-Gm-Message-State: AOAM530UKeJaHs+OROxCdRkeVZV0nPeaQfJGVrmrA1m7j3Jh8obXSfjd
 fMPu8nosVbo38W9lLNL23+b1GEnNWSY6+g==
X-Google-Smtp-Source: ABdhPJwVkq2VWEOIZltHutKFX20Y7GM7g9KMzTtG2gdbrY9yXTSVUqxn5fhB9r0XMUL+BgQRFQ+Wiw==
X-Received: by 2002:a9d:4f0b:: with SMTP id d11mr7033688otl.208.1612818405648; 
 Mon, 08 Feb 2021 13:06:45 -0800 (PST)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:1448:f93a:980c:e25a])
 by smtp.gmail.com with ESMTPSA id m7sm3942864otq.33.2021.02.08.13.06.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Feb 2021 13:06:45 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: Change in ...meta-alibaba[master]: thor: initial machine creation
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <YCGjdU3N6bHS/A1a@heinlein>
Date: Mon, 8 Feb 2021 15:06:44 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <35675947-5C93-4D51-AE6D-2BD178956213@gmail.com>
References: <94c8af34-dcae-e33d-a0f0-a5540ef518fd@linux.alibaba.com>
 <YAneI7zHQx217lmu@heinlein>
 <5841da60f00cade13d87d5b8795f8a25021c2e44.camel@fuzziesquirrel.com>
 <f8678061-4662-4445-a4d0-016040f00979@linux.alibaba.com>
 <0008fa42-2a5c-b092-8da6-7eaa91e775f7@linux.alibaba.com>
 <0FC93EA6-AE09-46A6-9BF2-36471B85755B@fuzziesquirrel.com>
 <fe3fef11-56c7-85a4-b3fc-35ab29e99f60@linux.alibaba.com>
 <20210202135122.kbvdfnq6ed2onuhi@thinkpad.fuzziesquirrel.com>
 <e7991363-133b-0ae5-9bb1-fd48719738d9@linux.alibaba.com>
 <20210208144446.l454phquipyvi7ur@thinkpad.fuzziesquirrel.com>
 <YCGjdU3N6bHS/A1a@heinlein>
To: Patrick Williams <patrick@stwcx.xyz>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
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
Cc: snowyang <SnowYang@linux.alibaba.com>, openbmc <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Feb 8, 2021, at 2:47 PM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> On Mon, Feb 08, 2021 at 09:44:46AM -0500, Brad Bishop wrote:
>>=20
>> This is an intermittant bug in the os-release recipe that we haven't=20=

>> been able to track down.  You can ignore this failure.  I'll remove =
the=20
>> verified -1.
>=20
> I thought I had fixed all the known os-release recipe issues not too
> long ago.  This one seems new to me:
>=20
>    ERROR: Task =
(/home/jenkins-slave/workspace/ci-openbmc/distro/ubuntu/label/docker-build=
er/target/romulus/openbmc/meta/recipes-core/os-release/os-release.bb:do_pa=
ckage_qa) failed with exit code '134'
>=20
> =
https://jenkins.openbmc.org/job/ci-openbmc/1758/distro=3Dubuntu,label=3Ddo=
cker-builder,target=3Dromulus/console
>=20
> Andrew, have you seen this issue very often?  Next time we see it, is
> there any way to get to the full build tree from bitbake?  There =
should
> be a log buried somewhere under /tmp that will give us the details of
> what really happened here.

Yeah, I=E2=80=99ve been seeing this one intermittently for a while. =
There was such
limited data, I=E2=80=99ve just been retriggering when I see it.

The docker builds are setup to use $WORKSPACE as a build dir
so it is persistent after the docker container exits butI had to =
configure
the jenkins jobs to delete the workspaces when done due to space
issues on the nodes.

Best bet may be to try and identify the file(s) we need and I can
have the jenkins job archive them.


>=20
> --=20
> Patrick Williams

