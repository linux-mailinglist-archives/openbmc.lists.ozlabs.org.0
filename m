Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C0A215FF9
	for <lists+openbmc@lfdr.de>; Mon,  6 Jul 2020 22:15:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0xd26ywwzDqdD
	for <lists+openbmc@lfdr.de>; Tue,  7 Jul 2020 06:15:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::732;
 helo=mail-qk1-x732.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WyiekGZ8; dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0xcH02k6zDqbk
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jul 2020 06:14:20 +1000 (AEST)
Received: by mail-qk1-x732.google.com with SMTP id 80so36101399qko.7
 for <openbmc@lists.ozlabs.org>; Mon, 06 Jul 2020 13:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=htGIuJKwNy/pb1NY51oWLpFSVPxHLzTcZwpsguVB+SA=;
 b=WyiekGZ8E444uJoQ17dQKpIr3Jt1k/ugl8hR2RaGCx9alqzf8zHuPAGbPzC6nRT26Z
 5OzxjYh+lX9qDykwFGFwStkcqXaMfHNeSz6J/2h7MoeMNUls5DCjcpywla5nghfiaxkG
 eLN1jJhfoFFd9JT6Tmi5Foa7iyURaHTZvj7vlDEwkLlC2ahBGvST0EXHYKUNTGji590L
 RU0/mLVY0IhqeIZfdZR+OBN4Gx18ZujeJvWES16Tvrnmje2vFFxfei+5MNwCsMpFs9Kc
 iWPph9GnplOx/dOdBN3oWpDnY+IEJ4iyEzpbMHGj5aPaL/F5ysjdHHUEaSmfvf9x11rK
 D6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=htGIuJKwNy/pb1NY51oWLpFSVPxHLzTcZwpsguVB+SA=;
 b=hw9DeW4bto1OHNTB32slgOO/Bn8wH0XxaK5OWu5Db8MAHvJu0tqGwGNVgGtq0xPr4i
 qLLnns7fAISALX8jPx98DBpGpc5KdeWuD/GTL/QvD9c4KWMDahh7sB28sWqJdSlqgwlq
 rt5haxgzh+Rk8EBqoYHY5r161T6O4qV966L9xTeOHnsJHxjhyKv+NkaQ97GujK0LpK9p
 V6U6IKdhmcuAb7btXWaOWym/Y9dl+h8kdZdof55p9GatinTUbkZmUEJSVr6Tvps5LjP2
 UTWQHoaFv90A0i/+092OJXOFVcylFoJvNFr0kg8SJgrPzPA7Ng75Wll7/0G3db4fTn+t
 lQSg==
X-Gm-Message-State: AOAM532rOneFEfjCFWA+WfVwZ/Aa8tBUdFTFYjGNL//d99A76IFwc9W3
 Pi4qIKMrCnsgvF2hOymSays=
X-Google-Smtp-Source: ABdhPJw0nZ38BG4odVZ3ccgHKjYJrlVOasZqpMCPYl7Jv0Px54KtEUHF2wGkHhA7OsrjJkH0uFUJdA==
X-Received: by 2002:a37:65d2:: with SMTP id
 z201mr24087301qkb.351.1594066457319; 
 Mon, 06 Jul 2020 13:14:17 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:3d62:4f68:17be:d26d])
 by smtp.gmail.com with ESMTPSA id u58sm24222284qth.77.2020.07.06.13.14.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 Jul 2020 13:14:16 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Multi-host support in ipmbbridged and phosphor-host-ipmid
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <SG2PR04MB316063EDE5B383B87F33D96BA76A0@SG2PR04MB3160.apcprd04.prod.outlook.com>
Date: Mon, 6 Jul 2020 15:14:15 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <A71CDDCD-C7D4-4ACB-80EE-EC03567F6B45@gmail.com>
References: <SG2PR04MB316063EDE5B383B87F33D96BA76A0@SG2PR04MB3160.apcprd04.prod.outlook.com>
To: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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
Cc: Kumar Thangavel <thangavel.k@hcl.com>, Ed Tanous <ed.tanous@intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Adriana Kobylak <anoo@us.ibm.com>, Vijay Khemka <vijaykhemka@fb.com>,
 Dawid Frycki <dawid.frycki@intel.com>, Patrick Williams <patrickw3@fb.com>,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Jul 3, 2020, at 12:22 PM, Velumani T-ERS,HCLTech =
<velumanit@hcl.com> wrote:
>=20
> Hi All,
> =20
> We have a multi-host system and wanted to add support in openbmc to =
handle all ipmi commands. We have come up with the design approach that =
could help us in handling ipmi command with multihost system. Please =
find the attached design proposal and provide feedback/suggestions.=20

Hi Velu,

Any reason we can=E2=80=99t just use the design template =
(https://github.com/openbmc/docs/blob/master/designs/design-template.md) =
and submit this up to gerrit? I tend to try and avoid opening any email =
attachments now a days.

Andrew

> Regards,
> Velu

