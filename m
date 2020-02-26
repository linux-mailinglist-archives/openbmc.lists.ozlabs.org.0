Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C5485170A46
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 22:16:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48STBl2XVGzDqcy
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 08:16:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::236;
 helo=mail-oi1-x236.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AfXlJwm/; dkim-atps=neutral
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48STB44pDjzDqhs
 for <openbmc@lists.ozlabs.org>; Thu, 27 Feb 2020 08:16:11 +1100 (AEDT)
Received: by mail-oi1-x236.google.com with SMTP id 18so1031242oij.6
 for <openbmc@lists.ozlabs.org>; Wed, 26 Feb 2020 13:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:date:references
 :to:in-reply-to:message-id;
 bh=ihJbV0abe/fFyzHb4quoPIIhF4L3dSuTURTOZR0JnII=;
 b=AfXlJwm/pkCtsbDBRuecDJAswnvLDefmk97zz/muJQvExK1w7L2hk9x9J7gJchpMdh
 yb28G6GLZ+mWs8r7fzM5Dqg5diNQWc2ia7q67ccXkw4ALba/WgW6LPF4yo26yF7niLzP
 5g6p0jqjczOrYSYB7FMMoTFvkm9uZC6AB/EeOFr8SPQqfo6eWqK0JeZ/frwW8+s3AOZX
 AwHz53xFNDK5fXcwOc8g+I3wlUFiGETu2tPRg+OodfCyxBX8AokRPr3W9gPI6GYbctwn
 vISUsYwFiKE2Rs7cJvojvgZgpQjishr54PGN355Li9Wi8t6pf6ocw5PyuTPI2Oq+xeij
 daaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:date:references:to:in-reply-to:message-id;
 bh=ihJbV0abe/fFyzHb4quoPIIhF4L3dSuTURTOZR0JnII=;
 b=XWN8HdYKb8Vo3UfPFaXBTtjj50VTIxtz/d8ifCOtpWV1QY7SLj32pXf/S30TiodpL+
 /fuG1US+nUcTzBIHJqJVSqWByzysyRT9jA8/0QbzIyRIjwLc31UYsuluDkb7NyAbQ4Cz
 2QNoNI+cmG4tjpOqC/LONh1T0bIiOolE148UPD0gz8ZuboUxP7VtpcHkkt0IzxNLCCuj
 VDEmrK1/sHGcnd7FGgkQROs122QaJfZUqzGXDuN1yg4k8yQClZrQRNLIMTPNcDl7S0HQ
 9FrJZPAmQHbAb/6l08JnabQfdLqcAibI/j3TmxGAvwhxiIALhkHlscMzCO8gqZOmLP9+
 XSyg==
X-Gm-Message-State: APjAAAU8tad+1GJTgeRba21df//1JXiGXOnaE/EYyT9ki3FcKiOaSNv3
 dgLWZ4I/rL+k2STDcGi7lPMaP9MSlu0=
X-Google-Smtp-Source: APXvYqxR8ykMMSzxvok9qt/uP1XtcrPwnMxEzxe88PUerOrUMMseFq9JitDEX8lsvR10mO+nx3Tvyw==
X-Received: by 2002:a05:6808:8fc:: with SMTP id
 d28mr810497oic.152.1582751768327; 
 Wed, 26 Feb 2020 13:16:08 -0800 (PST)
Received: from andrews-mbp-2.austin.ibm.com ([129.41.86.0])
 by smtp.gmail.com with ESMTPSA id i20sm1182922otp.14.2020.02.26.13.16.07
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Feb 2020 13:16:07 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: Enabling OpenBMC Debug
Date: Wed, 26 Feb 2020 15:16:06 -0600
References: <776B4FA1-4427-4FC1-802A-BC4192CA3D2E@gmail.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
In-Reply-To: <776B4FA1-4427-4FC1-802A-BC4192CA3D2E@gmail.com>
Message-Id: <47466143-F32E-415B-80C5-4C4C2EBBDDAF@gmail.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
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



> On Feb 11, 2020, at 9:51 AM, Andrew Geissler <geissonator@gmail.com> =
wrote:
>=20
> I find myself running a lot of different commands to enable a variety =
of
> debug data on OpenBMC when debugging different issues (usually BIOS
> communication issues). I also end up giving these commands to a lot of =
people
> when recreating issues for me. Stuff like this:
>=20
> # enable debug logs in journal
> sed -i 's/info/debug/' =
/lib/systemd/journald.conf.d/journald-maxlevel-policy.conf
> systemctl restart systemd-journald.service
>=20
> # Enable BIOS communication service debug
> sed -i 's/mboxd/mboxd -vv/' /lib/systemd/system/mboxd.service
> sed -i 's/btbridged/btbridged --vv/' =
/lib/systemd/system/org.openbmc.HostIpmi.service
> sed -i 's/ipmid/ipmid -d 0xff/'  =
/lib/systemd/system/phosphor-ipmi-host.service
> sed -i 's/0/1/' /etc/default/pldmd
> systemctl daemon-reload
> systemctl restart mboxd.service
> systemctl restart org.openbmc.HostIpmi.service
> systemctl restart phosphor-ipmi-host.service
> systemctl restart pldmd.service

I put up a proposal to try and standardize our debug within OpenBMC
up at https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/29684

That would make something like =E2=80=9Cobmcutil debugon=E2=80=9D much =
easier in that
it wouldn't have to know all the special debug incarnations per service.

>=20
> I was contemplating wrapping the above stuff in a obmcutil command so =
instead
> of telling people to do all of the above (and dealing with situations =
when
> those commands change), I could say something like run "obmcutil =
debugon".
>=20
> Any thoughts out there? Would finer granularity of the debug be =
useful?
> Are there other forms of debug people would like enabled?
>=20
> Andrew

