Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F109AA45235
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2025 02:32:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2cRP4QPWz3cY1
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2025 12:32:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1043"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740533566;
	cv=none; b=DOqPf8LpfaENj5IXSTeGFuUSs3rJxM3ORk6olg0C1i6ZrkBGhGw/kyQq0oR2tOqieoZMA5CHWGUBJ6JXjk45VUixuIphtTiwzQtSpCGTYm1uHJSn+zDkX7ytInm+Rwasrt+e9gDhy4xxAzIrpNgCy2atIS+VpVm2ndaq8YKwCdStDCMpAg+qSN3WrbZU2ZgSAmN4IORdyD3UiAqn9+Kxah6mxWARJvwb3FaLIX2EuYQFJr+iFFRyTS2c4Okl3FFVia42iCQWaCefbW0kQcDwnxn9F3deClaJlPb8xAjBAsoyvtIGOcz6gV31LJN7XVEfSelwHxDzFvo2FqhwXT738A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740533566; c=relaxed/relaxed;
	bh=Kp2hNPIrnu51+BN777D6JCnnpcLJuQQKA2MjCkP89Qw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rg4fsPN+HCF6CNGRIt9VIXTOWVA6DVQzQJVTxcxPqKidRsUk7F1sTZ4DpT+zCnuuQCatZU3nrhyqxJ8VrN2x9mpasBaTRhG8/X1x8VrMOoQHyHPQJexL+Bal67faPjnhSadKP/KmvLBKkXBc7UrqyGHxZvpf1r+zuTNEHRd9oAn9+PRJOvMUn5+8JfsI4PyfXTMb0RQtyqsqtj8pAvlkftfvjO/RURSVN20G5dnWyopk9GCZumfg4+gNzRAf7KlsNme2haurBHaI2rOJBejG8hOQPGg4r1gAM7JiY36DH2OTOttUWE/rqPQwULHASfzYeb0ZpVW3dI0wK0y6weWpVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SxPwICLn; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1043; helo=mail-pj1-x1043.google.com; envelope-from=wangzq.jn@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SxPwICLn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043; helo=mail-pj1-x1043.google.com; envelope-from=wangzq.jn@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z2cRK4xtnz2ydQ
	for <openbmc@lists.ozlabs.org>; Wed, 26 Feb 2025 12:32:44 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id 98e67ed59e1d1-2f9d3d0f55dso9619704a91.1
        for <openbmc@lists.ozlabs.org>; Tue, 25 Feb 2025 17:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740533562; x=1741138362; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kp2hNPIrnu51+BN777D6JCnnpcLJuQQKA2MjCkP89Qw=;
        b=SxPwICLnMcOQ02Au8CJJKlCOnsGUII/ljNHTqwlc+yW0SZFbWHkupTZZsUd/UNZ3XC
         hiqwWhHnlVT9yP9LVCyy5e1FNv9m81td7IqCnleRU2pqji8RN250RfEq4PpGflAuYv+w
         GM9rpxvBPcmzgKFGl5r7ATivM3iwEs65fwhxcoBaq1j383MSmBT/adEdbYhHKcRhkD2Q
         sIi9Qch2i0wos+YTi/6Z/Ux6xut2kZuoJNh5SyIipEsGFXZLdqHl3ItTmKzqb0YppZJe
         a6nCTkkEgoIvP0MwKL1p4/krK7cNXMMnhlMAMHA/1TqeTIdVU+ha9CS1a5pvNwzeeOfA
         YvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740533562; x=1741138362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kp2hNPIrnu51+BN777D6JCnnpcLJuQQKA2MjCkP89Qw=;
        b=VvPlx9WD26oCLoWgps35T0bnwTbKPqsAx8OrVT5ut5PwU0jBEnHcf0SjdBBlVVxh0s
         ww4WI0oleCJi03GvP8XNJDyXDQMoUW9JQZWR4TB+OwWVDGqHj0o7ilVotbD7tECIrl0c
         spc2lwvYLqJlrV46FS40WcDqHujb70FPWx+T9a3S0JCN7FKp7N/b3Qmx5iLJLVT+KCmp
         89siETgmhVAIZ54myitPjeyTr11qopwLe3dS/AYUoZmE2gQqH05G7gkkDhsWV+z11CX1
         J1oTIJ6ktLWhuOrvPzyfg7giN3URUo5pV+ffyLWwzaT+OOe9p35g3i4Ycuce32nBBDyH
         EmsQ==
X-Gm-Message-State: AOJu0YxJEVCQ6VVJDrrMjm/0Fc1B2O9HeNS8ZaeXcfbI0BQjzmRzqbNa
	loK1qjFoDM/3RSV4uKlc7LiMCqDcPlaHta0TbYchvFu6fxlb5fQrzgpWfklA13RQRNqT/T23dsV
	XDbIfBY60D3gQZQj6Gelu4UYju/I=
X-Gm-Gg: ASbGncsHTewG1NAlCuHpRi2+VJqJ9q1kmn1OKPwJkoj05YTIJNm6gr4sIW4LezjJMzs
	b4Qt0qK9U+XowmdA4zeSGP8h8q5q+IQV0epAirNSjvbDKhox2Mc3Osey8hOz6LeJzS9znFWMvD1
	Ys3B1SeysZ
X-Google-Smtp-Source: AGHT+IFx43ICjF3FL9OVU7dzcWrPJRrD/eUGz20OxXaulM3IM7k/uUjELnsU3Mbechx0QeEPbpkxev957xif7CW8I+0=
X-Received: by 2002:a17:90b:548d:b0:2fa:f8d:65de with SMTP id
 98e67ed59e1d1-2fe7e39f2e8mr2015412a91.22.1740533561917; Tue, 25 Feb 2025
 17:32:41 -0800 (PST)
MIME-Version: 1.0
References: <CAFCYAsehYZZTEWkZ3PuTcEG6ivTodXPNfV1pRZF+4qTXL_Qs8Q@mail.gmail.com>
In-Reply-To: <CAFCYAsehYZZTEWkZ3PuTcEG6ivTodXPNfV1pRZF+4qTXL_Qs8Q@mail.gmail.com>
From: John Wang <wangzq.jn@gmail.com>
Date: Wed, 26 Feb 2025 09:32:30 +0800
X-Gm-Features: AWEUYZk4ILe8ObT23Ay1Yd8r-7JiWowqOcsbpnYVrhNDpM2ISA6i2jugmaw_Z84
Message-ID: <CAHwNHZX=ZTgr0D16Ow+1cyNYtND1W6JQUwmzgCMgw_1cJAG8Fg@mail.gmail.com>
Subject: Re: ASpeed AST2600-A3 random resets (message BP0c00)
To: Jeff Johnson <jeff.johnson@aeoncomputing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi, Jeff

You can check section 61.2.2 "OTP Configuration Register" in the
ast2600 datasheet

The OTPCFG0 Register Bit9 describes the meaning of "BP0C00"

B means "Boot from SPI"
P means "Secure Boot Pass"
c00 is not explicitly defined in the datasheet

Additionally, you can check SCU064(System Reset Event Log Register),
and It's logged[1] during boot

Based on the logs you shared, WDT related events appears suspicious
and might be worth investigating

[1] https://github.com/openbmc/u-boot/blob/v2019.04-aspeed-openbmc/arch/arm=
/mach-aspeed/ast2600/scu_info.c#L92

On Tue, Feb 25, 2025 at 3:58=E2=80=AFAM Jeff Johnson
<jeff.johnson@aeoncomputing.com> wrote:
>
> Greetings,
>
> For weeks I've been playing hunt the wumpus trying to figure out why
> ASpeed AST2600-A3 SOCs randomly reset. The only serial console
> indication I get of the event is "BP0c00". No messages or console
> output preceding the "BP0c00" event and resetting of the SOC.
>
> These reset events appear to be random. Sometimes they happen within
> an hour of powerup/boot, the last event was over two days after
> powerup/boot.
>
> There have been console messages preceding the BP0c00 message but in
> some cases those messages (eth1 NSCI AEN) occurred over 24 hours prior
> to the BP0c00 and reset.
>
> Has anyone familiar with the ASpeed AST2600-A3 SOC seen this happen
> before? Any ideas what BP0c00 means and what could trigger it to
> occur?
>
> I put it up on pastebin as not to clog the list. If anyone can look
> and give me some insight as to what may be going on I'd appreciate it.
> https://pastebin.com/TNup7kjh
>
> Thanks,
>
> --Jeff
>
> --
> ------------------------------
> Jeff Johnson
> Co-Founder
> Aeon Computing
>
> jeff.johnson@aeoncomputing.com
> www.aeoncomputing.com
> t: 858-412-3810 x1001   f: 858-412-3845
> m: 619-204-9061
>
> 4170 Morena Boulevard, Suite C - San Diego, CA 92117
>
> High-Performance Computing / Lustre Filesystems / Scale-out Storage
