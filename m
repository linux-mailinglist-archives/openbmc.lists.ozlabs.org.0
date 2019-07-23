Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F1A70EB6
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2019 03:35:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45t1J64ZMNzDqWk
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2019 11:35:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=benjaminfair@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="uAoPv2Zb"; 
 dkim-atps=neutral
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45t1HV09t8zDqVV
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jul 2019 11:34:39 +1000 (AEST)
Received: by mail-io1-xd2a.google.com with SMTP id o9so78387281iom.3
 for <openbmc@lists.ozlabs.org>; Mon, 22 Jul 2019 18:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RZyBQ2HPUcpSZFSEjSBs0JoJN5hsVsIfWS0Emas9yCM=;
 b=uAoPv2Zb9u4sD/YPrnGm0IDygfmZjU+ENhLmr82xHi7YbZLBDOBWZItEC2MxLs3BCm
 u/I0KXyuMzClXXz2MYF9egqHmTg50pTDoszgYporptschuL7ixso9tUk1iLvCFCv0FFB
 1uC6P3pBClUTFj7voTH6vt8etuhgzFOtAgHpyNA9T3tgrvqy+SjVN7nglIuhw508w1jc
 120N2peDfkelup+yQ+0d97E/ecb46njPzIyqWzBos/j4c6/UcKBZoblULp/LcGHob3f7
 aQBqbO9nUE5XQVazogd6zmviir83aRUDljakJMaB5jtyzPI6gsjLgTPxjDTHQ5sFH6j4
 3xmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RZyBQ2HPUcpSZFSEjSBs0JoJN5hsVsIfWS0Emas9yCM=;
 b=S56yWEzDt1IKC0ZIGrn/3g7gKixT/2ggD6S4zhuzHqmtGj2j01hqnslMbJ6+6IXOPf
 uNJwZUzoBn60HJWTfrrWHmci+rPtcZX81RSCDR795BSsPXdxAWMVTm2TAlv3qoVrd6L5
 0M5ujMOpXoxNuEgFqfTZv+UP5qZFs1ZweZ7O+2FRzcwdOloTgYl8ns91aPO00/cGP/57
 /OT9xKFoaI6RHTeNjVuOlrL2FknWBQ6vSApIvVbcsCh9cml5zs3QBVThQNDcddDGgsMZ
 z7vcmjjZUN5MDrFCi8SDPZZohg5CwZwRT/jdmaad1dM4cwNMAko99CGT8F47cL9uLuhN
 0JcA==
X-Gm-Message-State: APjAAAXuQlP8+/Stdu/osbY4Ei3K7Z1zhnU3UNdlscuZ2glUUSEAYUF1
 ACiHgrJO1Ep1FXRCK4WjmT5cyE2GvwtOghPDHMwoCw==
X-Google-Smtp-Source: APXvYqz+XG2e4wlzSEwPY1n54rPrPEhKWs26LbO7nlJOxStLPiPFzhYyTt688BBCJUbQMegghfwkRHohsbXDErWP13U=
X-Received: by 2002:a5d:9d90:: with SMTP id 16mr25031906ion.132.1563845676720; 
 Mon, 22 Jul 2019 18:34:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notwpKm8KLiXbL_+02DLUsvjjZqAPBCujnTLCd8GnheQQvA@mail.gmail.com>
In-Reply-To: <CAO=notwpKm8KLiXbL_+02DLUsvjjZqAPBCujnTLCd8GnheQQvA@mail.gmail.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Mon, 22 Jul 2019 18:34:00 -0700
Message-ID: <CADKL2t4DztiWaWDFpYK_iHqyJxxk2+dgOhGTgayT2uUPVqGcKg@mail.gmail.com>
Subject: Re: ipmi-fru-parser + entity-manager
To: Patrick Venture <venture@google.com>
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
Cc: Ofer Yehielli <ofery@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Tanous,
 Ed" <ed.tanous@intel.com>, James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jul 22, 2019 at 3:25 PM Patrick Venture <venture@google.com> wrote:
>
> Does entity-manager manage the FRU eeprom devices?  Or does one still
> need to configure ipmi-fru-parser, etc?
>
> Patrick

There is a FRU parser shipped with entity-manager which searches for
FRU EEPROMs and attempts to read them:
https://github.com/openbmc/entity-manager/blob/master/src/FruDevice.cpp
