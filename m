Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 762F75B5A50
	for <lists+openbmc@lfdr.de>; Mon, 12 Sep 2022 14:42:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR5pr1FPkz3bkx
	for <lists+openbmc@lfdr.de>; Mon, 12 Sep 2022 22:42:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=thson.de header.i=@thson.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=DpNeTGZS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=81.169.146.218; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=mail@thson.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=thson.de header.i=@thson.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=DpNeTGZS;
	dkim-atps=neutral
X-Greylist: delayed 175 seconds by postgrey-1.36 at boromir; Sat, 03 Sep 2022 02:14:16 AEST
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MK2zX6VTxz2ymS
	for <openbmc@lists.ozlabs.org>; Sat,  3 Sep 2022 02:14:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1662134892;
    s=strato-dkim-0002; d=thson.de;
    h=Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:Cc:Date:
    From:Subject:Sender;
    bh=sAbF9iPw+y4hk+oru4mZoZd2g7ZkslkiJfXTXcoFrsY=;
    b=DpNeTGZSV5kUCENSpVF6W3vg1IEm7mG0qr9MxLVWuxKkxxbNzV5o7axQFV+UM3whUQ
    ZSwlNvxlRe3gSbO9ZjL9fCmKn1aJExdc5WnpNiC59pKJqoodg1iL4yMJvbmtqS8mdjFt
    cLhADFHzukRL0UYSUJftTMz2Aw4SyUV/NK3mP/duJ+LQiboDNgNZSnKgb99XdFjg0kPy
    06UyHBg/T2g8p3a2cXODLVuhXClTNL587fVxYVAJ65d4Dwov92PKoBZeA0Ld9Lx9bkWm
    MK6KDvJtKHeyl8UkrLlrCJzEVNV21XvxPmm5MrNemuT0zFijESExlX2jaFHTQQuA/nAF
    nPbw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":IW0NeWC8c+zN1nIYOgi8rPKEoKABwRR6O3/XVYQwebKxhbfzdsCxr9FG2IA="
X-RZG-CLASS-ID: mo00
Received: from mail-ua1-f45.google.com
    by smtp.strato.de (RZmta 47.47.0 AUTH)
    with ESMTPSA id c9cfa4y82G8CafY
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate)
    for <openbmc@lists.ozlabs.org>;
    Fri, 2 Sep 2022 18:08:12 +0200 (CEST)
Received: by mail-ua1-f45.google.com with SMTP id d14so962696ual.9
        for <openbmc@lists.ozlabs.org>; Fri, 02 Sep 2022 09:08:12 -0700 (PDT)
X-Gm-Message-State: ACgBeo3KxDWDHvTDaMs8ahvLEeAkwnLnmXq6LFvi9YWZ0pWIGiFx2onn
	tcz4aA4PCwk/mt3qUQwDUHbVQQeb9NeIMFc1E28=
X-Google-Smtp-Source: AA6agR4XyRVgkc9k4viUAn13xwjkGERMRzqkeWO7jXozbHPcTF9fxmyO4xe9i/olhBa3H/pZGcHk5PUo6FyBJPvrSig=
X-Received: by 2002:ab0:35d4:0:b0:3a2:b85:c04b with SMTP id
 x20-20020ab035d4000000b003a20b85c04bmr6369081uat.43.1662134891377; Fri, 02
 Sep 2022 09:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <e093dea2-ca08-fd8d-3151-2e858164f633@linux.ibm.com>
 <c0f6cc7e-6c7e-fe22-498d-2c3cb7851b73@linux.ibm.com> <YxCWpNZ+O89B+ulA@heinlein.stwcx.org.github.beta.tailscale.net>
 <16276.1662067381@localhost>
In-Reply-To: <16276.1662067381@localhost>
From: Thore Sommer <mail@thson.de>
Date: Fri, 2 Sep 2022 19:07:58 +0300
X-Gmail-Original-Message-ID: <CALYC-5TDj4Vas=Z6VooCWFKi+XFWwdTqe0tQmiyWaiLXYyV4Sw@mail.gmail.com>
Message-ID: <CALYC-5TDj4Vas=Z6VooCWFKi+XFWwdTqe0tQmiyWaiLXYyV4Sw@mail.gmail.com>
Subject: Re: Security Working Group meeting - Wednesday August 31 - results
To: Michael Richardson <mcr@sandelman.ca>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 12 Sep 2022 22:41:37 +1000
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> My understanding is that keylime is being rewritten in Rust.

The Keylime agent is rewritten in Rust and the plan is that it will
become the official agent over the next couple of months.
The tracking issue can be found here:
https://github.com/keylime/keylime/issues/986

The server components are in Python and there is currently no plan to
change that.
