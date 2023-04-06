Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA7F6DA1CE
	for <lists+openbmc@lfdr.de>; Thu,  6 Apr 2023 21:44:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PssQh64V6z3fVk
	for <lists+openbmc@lfdr.de>; Fri,  7 Apr 2023 05:44:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=MLNKyVvp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=edtanous@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=MLNKyVvp;
	dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PssQ51V0Kz3cHX
	for <openbmc@lists.ozlabs.org>; Fri,  7 Apr 2023 05:44:11 +1000 (AEST)
Received: by mail-wr1-x434.google.com with SMTP id r11so40591710wrr.12
        for <openbmc@lists.ozlabs.org>; Thu, 06 Apr 2023 12:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680810247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dELOiCDO3bZKqDivMxJbISQqBhBHutbdItoo5XtRit4=;
        b=MLNKyVvpiP+fQgw2r0iybSl1DS5viokKqACYK3TK2k4xIjuX0QbuCJ9IoTAV2o4d2B
         5s61RzDjeiWBKBTVzCHQdQspCwMnBq9Ujrs/rxZbAoXuZyYZuteyuI2lVUSoAjy+r4TI
         V401fsR7ICQ7WdepzPmfhaBAZXaUtnb0hLpVQ6OQaVLOQYo6ci5A4uCPXjv01D+W+XXw
         qtGF0rsnBR0W3w5qX/2tW9eV1RHJiCEP8/PcPq7IOgm1gqpq4KAIjzsoa+Jq/RUS+1mr
         H++p3t2QjGbP3qg8tfjyJ1m//+0Xx0yKM+GBI0TN40s8/lsw5eAymLehK7G5Laq1V0Yp
         VrQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680810247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dELOiCDO3bZKqDivMxJbISQqBhBHutbdItoo5XtRit4=;
        b=TEhPVPGroulsEmOCln4jXdZZpOnnEbv2uXbb3sT/TwnCxpPOp8fHBAoLgBIu09xc2b
         HukNBtZoQxZEGndGQ+jXwJCkBLIkkQvHqGDhyNJ188V12liekArY9BUEvtSfrZSmgdIw
         DTwMDlGdu2rq6+cwiiCXZOqxaaXDYCJ9mHQEa/F+ISMTdLUkDg+/qW1WoCeslwvpctBs
         jtZd0M/43nIvBEV32x4Job6pP5k4gGiuf1xCWcYxM1iHUVVMeE/9FS/jKcmdtkQP1ATw
         oSdRSFsicJzq51z7Wvrspw5NQYfLCmFX+CVAefDnrxwm/Yo8w0E2tnM8AX1IiJNs0Iao
         8dWQ==
X-Gm-Message-State: AAQBX9dlS1CtRI8lPuR+a2KTsgG+2geux2jLbV+Qgd35t/ywFMVRvwMS
	lWzvfGQLRxoJusYVPGNm3/KvPE0cbs0WMpKwSCKu1ikhYrFYG3n3VXw=
X-Google-Smtp-Source: AKy350ZCKxTFrz1RBHW6prHMu/iAKpIb2d8PC4SWUQqT2Rif1bOqpPT5ks4A6zozmbcTPwSLzAnr/BqU2a4K+/2M98Y=
X-Received: by 2002:a5d:4603:0:b0:2e4:cbbe:cfc7 with SMTP id
 t3-20020a5d4603000000b002e4cbbecfc7mr2280283wrq.9.1680810247382; Thu, 06 Apr
 2023 12:44:07 -0700 (PDT)
MIME-Version: 1.0
References: <552186c1-50c4-198c-57bb-98ab3ac29d58@linux.ibm.com> <6411.1680807620@localhost>
In-Reply-To: <6411.1680807620@localhost>
From: Ed Tanous <edtanous@google.com>
Date: Thu, 6 Apr 2023 12:43:56 -0700
Message-ID: <CAH2-KxD9xgZ+qxbCXO5CLLFSFcqdEh_fbEmh3LGBpNAqW7KEMA@mail.gmail.com>
Subject: Re: Design to isolate BMC service access
To: Michael Richardson <mcr@sandelman.ca>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Apr 6, 2023 at 12:10=E2=80=AFPM Michael Richardson <mcr@sandelman.c=
a> wrote:
>
>
> Very much exactly OAUTH2-like: JWT, CWT. In fact... I suggest not
> re-inventing the wheel here.

+1.  My first thought here was "Doesn't Redfish already support
oauth?".  If this is different, let's call out exactly why it's
different.
