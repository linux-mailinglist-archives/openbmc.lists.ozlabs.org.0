Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C01D34895B6
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 10:53:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXTfZ4k2Mz2yJF
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 20:53:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MIStzEFn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130;
 helo=mail-lf1-x130.google.com; envelope-from=hughsient@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=MIStzEFn; dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXTfB2BFmz2y8P
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jan 2022 20:53:04 +1100 (AEDT)
Received: by mail-lf1-x130.google.com with SMTP id h2so42236939lfv.9
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jan 2022 01:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=t8DZ0HGjtw7R2A1GzqcwS8tXsrjGFP3Rbfd4wReiZGM=;
 b=MIStzEFn9bgHBSw2yHYRTtuZXm8pt+n7/OD5TNMOoYnWXvOP1SI+Sw5aIlQXPiXhd9
 E9PI/5ElnxBQfITUqTNmYnMroyRz3FAz5kLimjirIF8YkHfmGYspCYAj0lw2ItQTk0UR
 Kq+dSJEbehjop1uOeT/F3W/M09LoCdOltOEB7dgFi1curfvHDrySlRhRAMnQRgXg1vL7
 oQWgNzMbi+BXbAonl4a/zw78kDrLxqKS+QOen7RBbVm9pD6XZfQ9fB/eWlfmN218YFd/
 MFQFE1njbmGbbwhycml7gh666YMmBGYQoJtDiktxwTcFn+I3pT9iMDFDQlj9sn1b7J5B
 DjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=t8DZ0HGjtw7R2A1GzqcwS8tXsrjGFP3Rbfd4wReiZGM=;
 b=AazkiHEXUzl3Lw/KSELabbXyU/0lNb5uPcdJrgx/KVOenobK/WVoPBYfkHEJxDof6S
 uFf5YA+tku2TJsHAPSs5iYz8CKOQLO0aMSvPIgH1MJaRMmO8aR+i9LwWDZ9PQWlnrils
 brEZ5uIjKkW0dmV4JSVLFVOtb5mUh3rvIn9V6N9osrIcsbHABUE/JY3OpBIUb9Bsrwp+
 1uzezuq/iOGImIjaFrnyB3G7XELB00MMqqgS/HAj29RIHhDmrHCqZukp5JJyIpf3OKhd
 6tq5G68ozlukKWlnPV2MUGO2BHXKNjfbC67DrgK1uYrwS1JjKw9lB2d/TtvFoJKxc3j3
 NG8Q==
X-Gm-Message-State: AOAM533Vs4VWW7pInDGtlyNEXzs3lYgb+aPkS5ilLlBvVEFrI2MaUnkp
 8nrGOZQwih+KrAVavXCh9oSfXWalThxj1+S9gMs=
X-Google-Smtp-Source: ABdhPJz4TE9APa9ejrNhvBX7nVcvqREtXzDFim97gQk/nizhjFXVDeSWAy5veoGioCxDAA5SW+6PpSKTVgzKKL+HEyM=
X-Received: by 2002:a19:2d05:: with SMTP id k5mr4345336lfj.504.1641808378135; 
 Mon, 10 Jan 2022 01:52:58 -0800 (PST)
MIME-Version: 1.0
References: <MW4PR21MB1922F2806870EBC2A7BDBAE9B04E9@MW4PR21MB1922.namprd21.prod.outlook.com>
In-Reply-To: <MW4PR21MB1922F2806870EBC2A7BDBAE9B04E9@MW4PR21MB1922.namprd21.prod.outlook.com>
From: Richard Hughes <hughsient@gmail.com>
Date: Mon, 10 Jan 2022 09:52:47 +0000
Message-ID: <CAD2FfiHfp=OQgQBzvzJGX1ARf-jWBWDsgVYokCC2kzQfQ1w3vQ@mail.gmail.com>
Subject: Re: Firmware update for auxiliary components
To: Derek Mantey <derekma@microsoft.com>
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

On Sat, 8 Jan 2022 at 00:45, Derek Mantey <derekma@microsoft.com> wrote:
> I am looking at enabling firmware updates for some auxiliary components i=
n our servers that don=E2=80=99t fall into the =E2=80=9CBMC=E2=80=9D, =E2=
=80=9CHost=E2=80=9D or =E2=80=9CPSU=E2=80=9D bucket.

If it helps, I've had quite a lot of success getting fwupd running on
OpenBMC; there are several dozen firmware update protocols supported
there.

> Or important discussions around the current design that I can look throug=
h?

What I don't know is how/if fwupd should integrate with OpenBMC;
presumably we want to expose the fwupd devices through the internal
D-Bus and Redfish APIs.

Richard.
