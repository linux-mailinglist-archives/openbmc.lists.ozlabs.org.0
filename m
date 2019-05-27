Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B7D2AD44
	for <lists+openbmc@lfdr.de>; Mon, 27 May 2019 05:11:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45C26y5q0wzDqKr
	for <lists+openbmc@lfdr.de>; Mon, 27 May 2019 13:11:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::72a; helo=mail-qk1-x72a.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Dmf++XmA"; 
 dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45C26T6Vy4zDqHS
 for <openbmc@lists.ozlabs.org>; Mon, 27 May 2019 13:10:41 +1000 (AEST)
Received: by mail-qk1-x72a.google.com with SMTP id c70so1564917qkg.7
 for <openbmc@lists.ozlabs.org>; Sun, 26 May 2019 20:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cPcKOr1ckq7kr0Q1VVXloklIvRJUvAWkYOGoPkAfOpo=;
 b=Dmf++XmA3vhU6IWKAbZdHjqeoDosK4nK9FlY43Ht+FHev3Q66MXs36LCD6etjUj9rP
 udYyhzhiiCNS+o0nnMfu8fHUCv2sBVyI6LvsOJRGxu098g2fzEVaxaZC10rywMihL7rp
 XIjXFAR48TsgQnIDr+vIUDui+2GJelC0hO+04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cPcKOr1ckq7kr0Q1VVXloklIvRJUvAWkYOGoPkAfOpo=;
 b=NYWnMao5DaDhgG/qk0flzSPa6KMnnIpV/LzIsyMm9kiQ/TFRLt/LEk++IpLfg7yL/1
 /E79ktEsrsoMaah0dQL58AqvvlfsMzsmBYDM9lrSLl72NLQkMcmalkqbhEFVJhu8D2VJ
 iEegoZXa4ZsSOqTsa+ZcZSDcgudKLkp9Apve0Eg9yNWlvlEdhYSdktqiOtly4QALtVC6
 1qM7oVpR3Imy6Gh2D9/leVYaQiK+4gRNcbpCLXjAhC9ywbCFXrb5MsX/ED7KvfcpYFuM
 kUZVblCa1PiR2JgzRwOA4pkPMfQ3LQwsP7+M/ie7kxQbCDU0uI64k+L7hY6ncwaAthO7
 IWnA==
X-Gm-Message-State: APjAAAWrh9krVsHvYDvDXM8YeDi+5ca+cQdf8F7LQEmMYjubJzY1MTOm
 8kP0e/3doxge3VYljLWg2gr5EMorUg37ijNVFSI=
X-Google-Smtp-Source: APXvYqx8/xk3y638gr97Ekd3GmDgo95gmsQ8M19GmCheVFMEZTNfUFimkrOanr7Kbi+VB+VybRCW52i5d7ZE4ZdeIfY=
X-Received: by 2002:ac8:7183:: with SMTP id w3mr7131488qto.269.1558926637495; 
 Sun, 26 May 2019 20:10:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190524120328.GA648@bbwork.lan>
In-Reply-To: <20190524120328.GA648@bbwork.lan>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 27 May 2019 03:10:26 +0000
Message-ID: <CACPK8XeXzDE6tsfE7X0qX5E9R2WPCqFT6OuAktNVy4uQxB0jEw@mail.gmail.com>
Subject: Re: IKVM on AST2400
To: "Alexander A. Filippov" <a.filippov@yadro.com>,
 Eddie James <eajames@linux.ibm.com>, 
 Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Alexander,

On Fri, 24 May 2019 at 12:03, Alexander A. Filippov
<a.filippov@yadro.com> wrote:
>
> Some time ago the obmc-ikvm service was added to the firmware. It causes some
> problems on our VESNIN hardware. As it based on AST2400 it does not have support
> for IKVM in the DTS. The system log contains messages that create_usbhid.sh is
> unable to find some items in the sysfs and then obmc-ikvm service crashes. It
> causes fail in QEMU_CI test.
>
> I belive that this issue also present on other platforms based on AST2400.
>
> IBM Guys: Do you run tests for Palmetto?
> Is there anybody else who uses AST2400?

I am not sure that anyone has tested it on ast2400. If it works, we
can enable it for palmetto.

>
> Well, my proposal is to make the IKVM support optional by moving it to the
> distrofeature.
>
> Besides, I've solved these problems for our hardware by adding required kernel
> modules and modifying DTS.
> IKVM works, but bring a lot of warnings after the host was shut down while the
> VNC-client is still connected.
>
> During the solving I copied some records from aspeed-g5.dtsi to aspeed-g4.dtsi.
> Should I commit these changes to Torvalds or OpenBMC repo?

Send them to mainline (Torvalds).

Thanks,

Joel
