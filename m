Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 630428110C
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2019 06:30:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4624ZZ5MP1zDqRq
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2019 14:30:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::72f; helo=mail-qk1-x72f.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="PZXPqPuM"; 
 dkim-atps=neutral
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4624Yv5WFCzDqRG
 for <openbmc@lists.ozlabs.org>; Mon,  5 Aug 2019 14:30:11 +1000 (AEST)
Received: by mail-qk1-x72f.google.com with SMTP id w190so59135701qkc.6
 for <openbmc@lists.ozlabs.org>; Sun, 04 Aug 2019 21:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ffo7puCOpEhKFmmgRbUR795F04Mprjeow4wWjgDKd60=;
 b=PZXPqPuMwPuRMkRWmd+YtJBDUycIw5Sv9N+P9QauN5ay4qYE4C5idnTLbjDJZ3042D
 JVQQV1qvNlaFRXdiKP55CAHYRK/0qy0XYTT/myVO+jc2sq0nQ337X+QY2Ekm0z3vQY2m
 jzlcUtO8oRojtjNJs7Ku14lAemO+w/yfNBJTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ffo7puCOpEhKFmmgRbUR795F04Mprjeow4wWjgDKd60=;
 b=mdyjJ177CqUecyec3TF2KrkDlxAckN2nk36+7VmtAboKhzkyNjLJmolq4NsU/zREoe
 DMZx60sHeglEGnBXGRxuiQHSJ6lyqVE6aAxeInxZhP6aJHSlXL6ougaSv2bCYiyy+0qf
 k4Xgl58o0UrU1qaqQ7h1x8ldRkrh0IX4Qg4h8lV6FHxoLTfe2nPML9Q9eKgnaGt86/iJ
 mx4DVg0DQNmdP+loVo9zTd36a2EVpSVxej9lIA1GFBfECu3UDdfjq8XwT7ilU+jMbyE/
 O3GZfxredeTrkvYWDQGevI3aaCYH5E1rH1C0UyeE0vm0P7vrENaf9/3nHFChB6xmmJLT
 POuA==
X-Gm-Message-State: APjAAAWEXDjF7BRxsFnlf7uaJdTOw/2+cjtCVP1VM2cTWzL0HLnqEjHL
 Y3n9XPi9AouCc4k7HTy2Yi0xwETCt8kKLRQUmfQ=
X-Google-Smtp-Source: APXvYqwo9MsDGC7vl9+hxI2a0DTdSwenqwt6On9VWKA/WfegQJcPB6Ge2U23W+BlY6Q8qGjHYEDWLULDyz2jv+wP5ZI=
X-Received: by 2002:a37:b0c6:: with SMTP id
 z189mr99215995qke.208.1564979408261; 
 Sun, 04 Aug 2019 21:30:08 -0700 (PDT)
MIME-Version: 1.0
References: <2819fa0b-82a2-0103-1451-6a41a9410339@fb.com>
In-Reply-To: <2819fa0b-82a2-0103-1451-6a41a9410339@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 5 Aug 2019 04:29:55 +0000
Message-ID: <CACPK8XcVdNMoksCc0OucgLw2-b7MWTNMyWwww-1=o7anC230sw@mail.gmail.com>
Subject: Re: Calculate BMC MAC address from NCSI NIC's base MAC
To: Tao Ren <taoren@fb.com>, Sam Mendoza-Jonas <sam@mendozajonas.com>,
 Jeremy Kerr <jk@ozlabs.org>
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

Hi Tao,

On Thu, 1 Aug 2019 at 21:15, Tao Ren <taoren@fb.com> wrote:
>
> Hi,
>
> I'm running Facebook Yamp AST2500 BMC and its MAC is connected to Broadcom NCSI-NIC. When CONFIG_NCSI_OEM_CMD_GET_MAC is enabled, BMC's MAC address is calculated by adding 1 to NCSI-NIC's base MAC.

This would be a good question for the NCSI maintainers. I've added Sam
and Jeremy to cc.

>
> This adding-one logic doesn't work for Yamp because Host-BMC MAC offset needs to be 2. What would be the preferred way to fix it? For example:
>
> 1) adding a device tree node (such as "ncsi-bmc-mac-offset") and send it to ncsi stack when calling ncsi_register_dev?
>
> 2) adding a device tree node to be parsed in ncsi stack directly?
>
> 3) adding a KCONFIG option so it can be parsed in ncsi-rsp.c directly?
>
>
> Thanks,
>
> Tao
