Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C9E15CC71
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 21:36:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48JSwP2ySFzDqWM
	for <lists+openbmc@lfdr.de>; Fri, 14 Feb 2020 07:36:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::234;
 helo=mail-oi1-x234.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fA9/yyJb; dkim-atps=neutral
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48JSvk4GXlzDqVj
 for <openbmc@lists.ozlabs.org>; Fri, 14 Feb 2020 07:36:02 +1100 (AEDT)
Received: by mail-oi1-x234.google.com with SMTP id q84so7188579oic.4
 for <openbmc@lists.ozlabs.org>; Thu, 13 Feb 2020 12:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=h62x62eCt6WK/bxVwHbf+cmKUGSo71F3RTFy7VFhIbE=;
 b=fA9/yyJb91C4nfOvjYcGGlmFFm21LapuPFUPIfuDzVXucJp0XE0SEvahZdex4Ej+Ns
 g2l+Dv3Kf9opDTx0k1v5214nCc5UtFoRiYE15d1LUJ2qhHvpkWorkaDIDE4FwGjbyc/6
 f7PKN6Z/cCqm4xgLgf3w9GYBwJKNX+emrfvt6VZVdZzCGLkps/3vCwRnSDEbp5/8j/op
 9l9VqERgRaaTGC6w6szpQ3kUFQ118DSWtISNZE9YFsnP1EOHHR5MD6jDkQIjLKGwI34l
 idFuSXHVISXSJyZ48qom+J72BxFLVjC8hL4SDLmjeH1YCo8ER8svI4u7RfsyRdjQM5FX
 8WBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=h62x62eCt6WK/bxVwHbf+cmKUGSo71F3RTFy7VFhIbE=;
 b=e17jaZYYoqRxEYjKOkalszAHbVZRt3e48kXQsVQuovd2fxCHcu0RPOk1riNG48Kl8H
 rqNbp+e3YFEies4CYVctywqgDZwX6Fr8xrJgXzAAV3HC4jEn/SGV8cnJxdOhmn4nsKTO
 cZYIRkAvx29Dg+zEnpV96OxlHjgEH/OG+Je+e4VMpPT6Oo3TYLCQMlJwTJjSesoZP/Lm
 nedPjAq1/2gqRL6cU/VEjPC5EDIJtqCTGEP1IVDuJwEh2ut5RtwYNAP1aV0cAB2KQZHx
 JVLVHw2PeNm+QJU70FoonFpgWALTZneTHHMumNUS5u59jYVpw1RBPt17/Z62K6GepF7J
 aWTg==
X-Gm-Message-State: APjAAAUZDnYRJFnTas8ImDJv0Y7cWH7woxDqUExTPSuqGNdpAmLkw9uo
 4nBSoSTztbHVw7ZRlbMTfe+wgoGC41A=
X-Google-Smtp-Source: APXvYqyv4AlWjxeXU4iEIlZvWh3VPGHoSXn0/a/dRiwzCuYNjlWj3KtMkK+2Vsn5QJmstFhoKV+1+Q==
X-Received: by 2002:aca:ec15:: with SMTP id k21mr4260546oih.35.1581626158837; 
 Thu, 13 Feb 2020 12:35:58 -0800 (PST)
Received: from andrews-mbp-2.austin.ibm.com ([129.41.86.0])
 by smtp.gmail.com with ESMTPSA id q22sm1164555otf.17.2020.02.13.12.35.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Feb 2020 12:35:57 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: Enabling OpenBMC Debug
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <95ebd954-01ad-c60a-7619-d2d7a39a2a58@linux.intel.com>
Date: Thu, 13 Feb 2020 14:35:57 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <825B4206-9134-4E39-9D50-FADA68CA0CA7@gmail.com>
References: <776B4FA1-4427-4FC1-802A-BC4192CA3D2E@gmail.com>
 <27a538db-96e4-f83f-6541-93e974f78ead@linux.ibm.com>
 <95ebd954-01ad-c60a-7619-d2d7a39a2a58@linux.intel.com>
To: =?utf-8?Q?Wiktor_Go=C5=82gowski?= <wiktor.golgowski@linux.intel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Feb 12, 2020, at 5:45 AM, Wiktor Go=C5=82gowski =
<wiktor.golgowski@linux.intel.com> wrote:
>=20
>=20
>=20
> On 2/11/20 6:58 PM, Joseph Reynolds wrote:
>> On 2/11/20 9:51 AM, Andrew Geissler wrote:
>>> I find myself running a lot of different commands to enable a =
variety of
>>> debug data on OpenBMC when debugging different issues (usually BIOS
>>> communication issues). I also end up giving these commands to a lot =
of people
>>> when recreating issues for me. Stuff like this:
>>>=20
>>> # enable debug logs in journal
>>> sed -i 's/info/debug/' =
/lib/systemd/journald.conf.d/journald-maxlevel-policy.conf
>>> systemctl restart systemd-journald.service
>>>=20
>>> # Enable BIOS communication service debug
>>> sed -i 's/mboxd/mboxd -vv/' /lib/systemd/system/mboxd.service
>>> sed -i 's/btbridged/btbridged --vv/' =
/lib/systemd/system/org.openbmc.HostIpmi.service
>>> sed -i 's/ipmid/ipmid -d 0xff/'  =
/lib/systemd/system/phosphor-ipmi-host.service
>>> sed -i 's/0/1/' /etc/default/pldmd
>>> systemctl daemon-reload
>>> systemctl restart mboxd.service
>>> systemctl restart org.openbmc.HostIpmi.service
>>> systemctl restart phosphor-ipmi-host.service
>>> systemctl restart pldmd.service
>>>=20
>>> I was contemplating wrapping the above stuff in a obmcutil command =
so instead
>>> of telling people to do all of the above (and dealing with =
situations when
>>> those commands change), I could say something like run "obmcutil =
debugon".
>>>=20
>>> Any thoughts out there? Would finer granularity of the debug be =
useful?
>>> Are there other forms of debug people would like enabled?
>>=20
>> Thank you for the information.  I keep learning all the time.
>>=20
>> These settings factor into service scenarios and also deployment =
readiness.  For example:
>> - I want to turn off debug.  For example, I want a debug-off command.
>> - I would want a way to validate (or at least show) these settings =
when testing firmware image release candidates.  For example, another =
obmcutil command "debug-show" which uses "grep -H" instead of "sed".
>> - I would want some documentation added the BMC administrator's guide =
to make them aware of OpenBMC debug support.  Draft: The obmcutil =
command can control debug settings for a variety of the components =
running on the BMC.  For more information, see =
https://github.com/openbmc/phosphor-state-manager/blob/master/obmcutil
>>=20
>> The obmcutil tool is a shell script, so folks can take just the =
pieces they need.  That is, don't be more granular at this time.
>=20
> Could we consider some sort of debug hooks directory (Like =
/etc/obmc-debug-hooks.d/) where applications could drop in their =
relevant scripts?=20
> Or is this going too far?

You can never go too far with debug :) I=E2=80=99m trying to think of =
what this would look
like though? Can you offer an example? For most applications they just =
have a
global =E2=80=9Cif verbose trace, log this extra data=E2=80=9D type =
thing.

>=20
> - Wiktor
>=20
>>=20
>> In summary, it seems like a good idea.  It seems like we should ask =
our service architects to weight in.  I'll go ask mine....
>>=20
>> - Joseph
>>=20
>>>=20
>>> Andrew

