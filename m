Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 668E2203B48
	for <lists+openbmc@lfdr.de>; Mon, 22 Jun 2020 17:43:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rDGf4ZcBzDqXM
	for <lists+openbmc@lfdr.de>; Tue, 23 Jun 2020 01:43:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::336;
 helo=mail-ot1-x336.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TfcVm+M0; dkim-atps=neutral
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rD876bJzzDqWW
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jun 2020 01:38:14 +1000 (AEST)
Received: by mail-ot1-x336.google.com with SMTP id n6so13432050otl.0
 for <openbmc@lists.ozlabs.org>; Mon, 22 Jun 2020 08:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=e2X8d/0JY2hl1V2LoAbVy/X9QLgRsDjawFtoOu/MmWI=;
 b=TfcVm+M0fSwKhjNdEgEH8NKTkEmrp7HSzeXolxRON1aEvpotQrBUCEAuUsm7Z2fng5
 lhe6ME2e3XhUI2EZN7xShYRRkF4fxgvZ4oLGqznjpKy/WiIbXf2n7UgFcCSxnF/XnAcP
 ejlBzu8SYigmMJkxaNt2804aFbXhzr3Kma0BBrq+JXSoEIwarOCU5kAoRhX4YjZfl8Sz
 mzkyfBWi99iRtWfMzGBfZhoP+v/RxJQmU8uJsR9zIM+E6x7QtaOpqvUYEfdEgS3aEntW
 XCAhWEoj7PXfDS4dVEMQge4l3WCwg+Ylqlz4K74sBI41fj/2nJuE+6e+4wAU4I52g6TO
 vDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=e2X8d/0JY2hl1V2LoAbVy/X9QLgRsDjawFtoOu/MmWI=;
 b=TcOsbFS2ZZyXuHhW30RUiBpTtNAedS36GljHO73gO7p99IR289EWOa+iSMKaPkOKju
 gAcwvktkmmEBwQrgEDm3v74An0pH/nqvZkQe3vFTxwVAvGvvxkCOlvquwpHWnMsdwXnR
 BbPyKmTtIku4qPIDXucgK04fZMpsKc0wtawAG/SP7WlnLLcpT/llfA5rmGc3D2JAu802
 PSiPdU0xQZDCkzZsHRKGAaVXeV8l873Y98lMmwQ7q2eHDrZMJPSfydMmU9XemFP4AWE7
 qyIHSi546On9sFh/vDnf7KesgZ5Re84l3IP1ulcFPjfL8XTs6qVSF5SDz1j9Zk/W8zQl
 B5IA==
X-Gm-Message-State: AOAM530PCSbxebSOz54b/8EsYVSIL/97wIMNOGVHAgJPrP+shTu8p5IE
 +hc4QnSpJjjjLCrzr8Ua9MM=
X-Google-Smtp-Source: ABdhPJzA5oH7ZwHfDAsdOua92L5BJVJI7vzGJtw1KpVhxpVACzw7fSjpL1D0azFSoLnPOrKjRYS8Sg==
X-Received: by 2002:a9d:53c3:: with SMTP id i3mr14867156oth.300.1592840291077; 
 Mon, 22 Jun 2020 08:38:11 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:cd9e:6084:3798:bc1f])
 by smtp.gmail.com with ESMTPSA id g126sm3280318oia.41.2020.06.22.08.38.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jun 2020 08:38:10 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: 4b32c9ae068beccc3755c48784253e96c31cfd46 brakes devtool
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <CADVsX88pzhA1eL1REB0GBXgpppbXsvdEzwDaXhUttSqxMbS1ow@mail.gmail.com>
Date: Mon, 22 Jun 2020 10:38:09 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <9EDC6332-5D71-4C82-895A-76E915031D20@gmail.com>
References: <CADVsX88pzhA1eL1REB0GBXgpppbXsvdEzwDaXhUttSqxMbS1ow@mail.gmail.com>
To: Anton Kachalov <rnouse@google.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Jun 22, 2020, at 10:00 AM, Anton Kachalov <rnouse@google.com> =
wrote:
>=20
> The commit 4b32c9ae068beccc3755c48784253e96c31cfd46 brakes the command =
like: "devtool modify phosphor-dbus-interfaces" in a way:
>=20
> Running on python 3.7.7.
>=20
> ERROR: Error executing a python function in exec_python_func() =
autogenerated:
> File: '/usr/lib/python3.7/sysconfig.py', lineno: 422, function: =
_init_posix
>      0418:def _init_posix(vars):
>      0419:    """Initialize the module as appropriate for POSIX =
systems."""
>      0420:    # _sysconfigdata is generated at build time, see =
_generate_posix_vars()
>      0421:    name =3D _get_sysconfigdata_name()
>  *** 0422:    _temp =3D __import__(name, globals(), locals(), =
['build_time_vars'], 0)
>      0423:    build_time_vars =3D _temp.build_time_vars
>      0424:    vars.update(build_time_vars)
>      0425:
>      0426:def _init_non_posix(vars):
> Exception: ModuleNotFoundError: No module named =E2=80=98_sysconfigdata=E2=
=80=99

Looks like this discussion:
https://lists.yoctoproject.org/g/yocto/topic/74637733=20



