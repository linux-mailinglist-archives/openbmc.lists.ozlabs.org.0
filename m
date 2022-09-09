Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9735B2E63
	for <lists+openbmc@lfdr.de>; Fri,  9 Sep 2022 08:00:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MP51Y6fJzz3bkQ
	for <lists+openbmc@lfdr.de>; Fri,  9 Sep 2022 16:00:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ph2dJocV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=fercerpav@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ph2dJocV;
	dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MP5181tW3z2yWl
	for <openbmc@lists.ozlabs.org>; Fri,  9 Sep 2022 15:59:39 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id w8so918445lft.12
        for <openbmc@lists.ozlabs.org>; Thu, 08 Sep 2022 22:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=GwEzI0kO4RfN5VRRjI+LE8P7tXiZTrFPjzX63q640wQ=;
        b=Ph2dJocVfu7cZCY74HPPZlmd8bTxu10YvyVfCNPq/GCd2dBg1r4n5HAOREcaTe3GMA
         nYKbrLxlN7YZeOwhQT1HzsXxjzhwxfcnCwCf7DwhwexFIUpWtGBjpIO88nTZJ7GFnxnO
         ZgSgLg9u+4RoGudchzNv9xQPdEMXZ7EdOeunbNUF0ZFSTxa/Dd2OuGU8rRwHelvORHe3
         XGUFqIOzH8wtENFZ34FBh7L8W9cjLpQXoyoIO67a0AbrUrTTCj5IPHUCuKEqKQbnU+X0
         trXVuMfGr55+WYQ3Vfy1Ob1jkJgGbyRKP1yFGYiAmsAIvfi7OutNrmQkcBr1KNQi2NLG
         WBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=GwEzI0kO4RfN5VRRjI+LE8P7tXiZTrFPjzX63q640wQ=;
        b=BG9BAQlf6u2JGCVA3Vm0hDqsSe2Jf6jEtdk6iyvKToli3goqdckCR7o5/FWGOrRCkt
         10OMlMT9sJDCyaJSj4qh5QCKmp6zhsIUFaVShFEfygBT0JUtj87z6+GHamT4YbVamCEj
         XIcbWcXoMjN87qzT0wiRBNQZyWAUjzLU3CMbls6AZJsnKYfjoYFGbLL9rBd9zaWLhdc7
         LOlH6/6T1eSXG54ESWGsRV9RPUd5gyHe/9DP3u48ld737yiiZrm563hfx5yj4w0w7vyF
         RfvFo8f79aOGxRWDXOQjJkFWE+jJxsfZtjfY5CoIeWarvXBOvrUp+QAefGVtm14dXAkM
         oxMw==
X-Gm-Message-State: ACgBeo3ahH5gLR72cfIxpRCJAXKY2JvSpeKmFJQ9osKNFxdvjGo25UZj
	ifDjFab9W0r9s+4o+yUeRX0=
X-Google-Smtp-Source: AA6agR6yNF7EskTL51ovmHGraZlE8pE/Hc4/xVbGT+0yH7C40goRUQ+C5UmhNoOhTK+6EjjbxPeBQw==
X-Received: by 2002:a05:6512:3a95:b0:498:f272:6587 with SMTP id q21-20020a0565123a9500b00498f2726587mr1537763lfu.148.1662703171985;
        Thu, 08 Sep 2022 22:59:31 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id r15-20020ac24d0f000000b00494a2a0f6cfsm129475lfi.183.2022.09.08.22.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 22:59:31 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 2895xRB0020092;
	Fri, 9 Sep 2022 08:59:29 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 2895xPve020091;
	Fri, 9 Sep 2022 08:59:25 +0300
Date: Fri, 9 Sep 2022 08:59:25 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: Re: [PATCH] net/ncsi: Add Intel OS2BMC OEM command
Message-ID: <YxrWPfErV7tKRjyQ@home.paul.comp>
References: <20220909025716.2610386-1-jiaqing.zhao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909025716.2610386-1-jiaqing.zhao@linux.intel.com>
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
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

On Fri, Sep 09, 2022 at 10:57:17AM +0800, Jiaqing Zhao wrote:
> The Intel OS2BMC OEM NCSI command is used for controlling whether
> network traffic between host and sideband is allowed or not. By
> default such traffic is disallowed, meaning that if the device using
> NCS (usually BMC) does not have extra active connection, it cannot
> reach the host.

Can you please explain the rationale behind introducing this as a
compile-time kernel config option? I can probably imagine how this can
make sense as a DT switch (e.g. to describe hardware where there's no
other communication channel between the host and BMC) but even this
feels far-fetched.

Can you please outline some particular use cases for this feature?

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
