Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C2A4AB3C7
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 07:12:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JsbQS5nx7z30RQ
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 17:12:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=brfYF7LB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::734;
 helo=mail-qk1-x734.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=brfYF7LB; dkim-atps=neutral
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JsbQ32CMjz30Lp
 for <openbmc@lists.ozlabs.org>; Mon,  7 Feb 2022 17:11:53 +1100 (AEDT)
Received: by mail-qk1-x734.google.com with SMTP id g145so10153727qke.3
 for <openbmc@lists.ozlabs.org>; Sun, 06 Feb 2022 22:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uUvKKdRxZurkkEqyKPvW6x/UVo0LYf76FNrt3fXI8PA=;
 b=brfYF7LBo9T+RebrZxYZDt/morh0fvX6cQ2kwjLplM+Qnb/x6YS6QrNWIEawnAMcxZ
 gHP9ko6H3V6dGHtzg+xXYEyf3os2c9V+o9EX4MC1Ir5yjnJEbmZyorUfDxA52Z1qmDM7
 fL8iSGaDO/SBnLi4WJXo7l3QsLyLdYWl0DhRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uUvKKdRxZurkkEqyKPvW6x/UVo0LYf76FNrt3fXI8PA=;
 b=nMGBa7aybHCZ+CgNE3bXo0AyBD5DbmcNSl8BaFmeahlfFdvGdnsGJjMcD2PBxiinR1
 l+tiTTEdL2whbhOVVj66xRdT5lM6ok/irDGTEp9n3zBl5dnbrvNpzmEl5SgOtQyDgalc
 Gq69tfQLPbwGpEX2ue032daUuWkRzrdoXEW36LBcLUPy6WLwhTC0HuOpDf6m/p4CcwxK
 PCUiIMLD5M+mVEiadM/9A5NKVgiepgnWYztDdS9E49gjZqBrr+H2RPIWrdFsEhCEKU6n
 QWgNvdK9Ijti68K1m/agKXS6xHKXC0KZHvBCtr2nTjE/3fnKykSvLwkUdfQDHU/QAq1J
 161A==
X-Gm-Message-State: AOAM532784BEfMnMUQ6kJAnfTkbYyxfNXWKuleazkq705eiJMVJThDMU
 KB+4fAb/b0hsuH1yEDHzOr5l2PPWalmvdlEybbM=
X-Google-Smtp-Source: ABdhPJxnkHo91NyEOri5RDRJ6+EnMnki7vhCLlbOnqPsHMBdD6puZ6OXVQTVR5+GYCG0ViCkiKLRuRtzKXQpU6YxYF8=
X-Received: by 2002:a37:b0c5:: with SMTP id z188mr5387270qke.165.1644214309836; 
 Sun, 06 Feb 2022 22:11:49 -0800 (PST)
MIME-Version: 1.0
References: <TYZPR06MB4015DC4BD5CA2FFAB595C69AFC2C9@TYZPR06MB4015.apcprd06.prod.outlook.com>
In-Reply-To: <TYZPR06MB4015DC4BD5CA2FFAB595C69AFC2C9@TYZPR06MB4015.apcprd06.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 7 Feb 2022 06:11:38 +0000
Message-ID: <CACPK8XeUeDSV7T8Rrtp2G99d0LdyXu0dSzHj3DnwRQr8Sm9zaA@mail.gmail.com>
Subject: Re: u-boot:rsa adds rsa3072 algorithm
To: Jamin Lin <jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Troy Lee <troy_lee@aspeedtech.com>, Steven Lee <steven_lee@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 7 Feb 2022 at 02:26, Jamin Lin <jamin_lin@aspeedtech.com> wrote:
> This patch was applied to u-boot/master, http://patchwork.ozlabs.org/project/uboot/patch/20220119082323.4567-2-jamin_lin@aspeedtech.com/
>
> Commit   2a4b0d5890deb0c973f8db7bb03adad96aff1050
>
> https://github.com/u-boot/u-boot/commit/2a4b0d5890deb0c973f8db7bb03adad96aff1050
>
> Could you please help to backport the patch to the openbmc/u-boot tree?

This patch doesn't apply cleanly. Can you send a backport to the list?
Please be sure to test that it applies, builds and runs against the
v2019.04-aspeed-openbmc tree.

Cheers,

Joel
