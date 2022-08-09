Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D7258D199
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 02:59:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1vpl3l72z3bkQ
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 10:59:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=j1p1Ia6v;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=j1p1Ia6v;
	dkim-atps=neutral
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1vpJ4FPQz2xGv
	for <openbmc@lists.ozlabs.org>; Tue,  9 Aug 2022 10:58:47 +1000 (AEST)
Received: by mail-ed1-x52a.google.com with SMTP id z20so11391049edb.9
        for <openbmc@lists.ozlabs.org>; Mon, 08 Aug 2022 17:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=vivogvUanLqf/+xeQKp88FPAZ7ZllTwvRVZ+ptlXqkY=;
        b=j1p1Ia6v5EBGIpl2oD43/FdFRIRl0/LQ0wJc5fito9bY1la3rf9Tu1Wg16hgsDyNuD
         8scWmOy5uXiq49/X8WWES+D8qWH0fKiXQzYAWhWrhfFWBrGQUe8jSyy+gJ+7AfT9p2Eh
         Y3VemtSfXGy1bjWMmP9W14bodaxRwGdHNzry4Ue0GGCOQjuQf9Jm4eLOyH4sn6fQbXc8
         ATfqgKHeQ4D+N2oP923BnzqNvnEuNmMGQlDF+F4mgDMfFL3K+CjfdCmNhQrOBWs/fk+0
         YAbJcqNUgvy1C0cTFzexI2xNAIyniRaAXcgu/rtcCtGPywAjmY/pM2mg2qE+17KfVhO5
         rzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=vivogvUanLqf/+xeQKp88FPAZ7ZllTwvRVZ+ptlXqkY=;
        b=KnzmnSEXt/6YBr+1sGDbS7NjaMno/JTz8+TQlk68l/ClY9KoGux1ZnbhGPJ1m4lJrn
         2fab4o+Q+uyZVb9I7eeenrTHA9NJAUVgFoRRSEllRNRiHS//m1l+gmq+xLHc3cDJDJiY
         gpHXXCaRRNrj+ZuJdclRhDRNz1+waZfNjknW4gzCKQrHlBgNqmrkTj1zvBxzSiYY8IIC
         J7OfdlBlIxUCX5uQNSNSpP7bGm5APcJss1TjUd3r9hkZb/kBGkKr0efGA964yztnOtlU
         3eFvIjRi6ktUNe4fN/K5RRSvmOJI96sI7bx0crDE93+hxARtMxNlGJoA0blHaTUupDK4
         mbnw==
X-Gm-Message-State: ACgBeo2orrlyPAxVXc2DUTmelI1iOj4gn2fVQWzaMRJTu7QydGSC5KZL
	BWQbOiCSmY6IAnZwAgAsQuB3L81U2r++H++6NMs=
X-Google-Smtp-Source: AA6agR4u+PwcE5Rt/E2Iw8gTIqyGOStyp3TcXeqQ7JtzNfC9nIjngdT+CDuIWjdizmLyndyNQ/e5KbErR2lBatKjaa4=
X-Received: by 2002:a05:6402:428c:b0:440:8259:7a2b with SMTP id
 g12-20020a056402428c00b0044082597a2bmr9071167edc.329.1660006721482; Mon, 08
 Aug 2022 17:58:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220610084340.2268-1-ctcchien@nuvoton.com> <20220610084340.2268-2-ctcchien@nuvoton.com>
 <YrCi1fg+mUPwZ7sX@zn.tnic> <CAHpyw9dkE65vUiyG-=gvQHGCZ-=nm1AX2EwANGPDAJmfn7sZkQ@mail.gmail.com>
In-Reply-To: <CAHpyw9dkE65vUiyG-=gvQHGCZ-=nm1AX2EwANGPDAJmfn7sZkQ@mail.gmail.com>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Tue, 9 Aug 2022 08:58:30 +0800
Message-ID: <CADnNmFre-rhBYKtqFs9JEgDYj8iAr5YZ0qs4MqXRczsL1Z65OA@mail.gmail.com>
Subject: Re: [PATCH v12 1/3] dt-bindings: edac: nuvoton: add NPCM memory controller
To: Borislav Petkov <bp@alien8.de>
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
Cc: CS20 KWLiu <KWLIU@nuvoton.com>, tony.luck@intel.com, rric@kernel.org, Benjamin Fair <benjaminfair@google.com>, linux-edac <linux-edac@vger.kernel.org>, KFTING <KFTING@nuvoton.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, JJLIU0@nuvoton.com, ctcchien@nuvoton.com, Tali Perry <tali.perry1@gmail.com>, devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, James Morse <james.morse@arm.com>, Medad Young <medadyoung@gmail.com>, YSCHU@nuvoton.com, Mauro Carvalho Chehab <mchehab@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Borislav,

Thanks for the review. I'll address the problems you have mentioned
and send v13.

Regards,
Marvin
