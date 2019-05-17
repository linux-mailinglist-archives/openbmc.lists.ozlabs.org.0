Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A69F82154D
	for <lists+openbmc@lfdr.de>; Fri, 17 May 2019 10:24:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4551Yh6jygzDqRM
	for <lists+openbmc@lfdr.de>; Fri, 17 May 2019 18:24:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::12d; helo=mail-it1-x12d.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rJes9Xow"; 
 dkim-atps=neutral
Received: from mail-it1-x12d.google.com (mail-it1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4551YG1P34zDqRM
 for <openbmc@lists.ozlabs.org>; Fri, 17 May 2019 18:24:33 +1000 (AEST)
Received: by mail-it1-x12d.google.com with SMTP id q132so10592228itc.5
 for <openbmc@lists.ozlabs.org>; Fri, 17 May 2019 01:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KCawJwIRpmLoOjsbWSaLBbQGwc9ZspH0ulsCk8l4fYk=;
 b=rJes9Xow29Chd/b9pe3mhFM9QVXacdJICAp3N0IQ9bX4pJ+ODQSCyPEHI+mOwTIpR/
 D9LSo8ysDSEAcx1s2qYtYx9PhI7zCHTu6eGuzUatnbzVfnG61h0kHDLZu5xu3GTLOSGI
 KWQXEi5PrL57Y22nbY7A0lYAObgCPJnSQkiPI1g/8idPd/PXlkr0ffp5KgPI8yhygcv4
 79nmAYdCXpjZCSFi8vHTUFM9YameqJgoRsu0n48BC7muWogZlR6sawgmsGHrLorwYscW
 98U8YlMA3K2wC/NhIl/wczuhQ1kGHZk/dWyPhk4iEdK7tA1v4JHmKyCoXwI84a7bsy8z
 gOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KCawJwIRpmLoOjsbWSaLBbQGwc9ZspH0ulsCk8l4fYk=;
 b=fAYQ0peUVoMVA8qPPekhyaxRp4+4JLU0dym60DqUwoH0Efnrugvdc3oApYThX4mE4/
 ys1x46jl6H9vbIEb1kdENmSrk5G9FeF2mZxImdx2Jr53jvTLauSB1c5yY6C+RiYrKcP1
 f3DnMMFvAEre3+OA6R6vmtPYbDRBrBTMGWqP1UfsPt2jqwYAdprpKipZiRYARDYrgaV6
 WHaIBLswSqYMjc1IHq6R8UjNOZrXXwpKaEXSZRK5kUi5UFCBAnXS7f7tacvqA+huNy0G
 itO/4WRwGAa7Its7DxEZ8G3I4coJa2CAQv7CRDz+aLTFql0YPtCggddlXnBHvq6YQ7e2
 7SbQ==
X-Gm-Message-State: APjAAAW9022Q56jT4dETgqCvwo+JRZ9QEa+4l6x/2018jSuU1mSgZn+n
 g/oD9PzSqXszhMc+MpsskzamE9YP5Iu1ACbx0Qc=
X-Google-Smtp-Source: APXvYqxc64t0ET3wPvL34eVwS8jEvp/NFPbwsIp9047/Bd+WGluWHWoRPj/ATjSKEIJNbMY+rZoSjjzsM+AmXPrX+nA=
X-Received: by 2002:a02:ca13:: with SMTP id i19mr35140592jak.77.1558081470030; 
 Fri, 17 May 2019 01:24:30 -0700 (PDT)
MIME-Version: 1.0
References: <24ded2792fbf485689db57aad5f98626@yadro.com>
In-Reply-To: <24ded2792fbf485689db57aad5f98626@yadro.com>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 17 May 2019 16:24:15 +0800
Message-ID: <CAARXrt=cNviWJC9-MSZr87Vo3E1daQ1VWN4u0dF+wmVbb3T8vQ@mail.gmail.com>
Subject: Re: Romulus avsbus-control and vrm-control
To: Alexander Soldatov <a.soldatov@yadro.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Alexander,

The related controls to IR35221 are referenced from meta-witherspoon
and Romulus schematic.
If you need details, possibly contact Nick (ngruend@us.ibm.com) who is
the chief engineer of Romulus.

Thanks!

On Fri, May 17, 2019 at 3:48 PM Alexander Soldatov <a.soldatov@yadro.com> w=
rote:
>
>   Hi Lei YU,
>
>
>   There is some question about avsbus-control and vrm-control on the Romu=
lus. There are no public documentation for the IR35221 chips, which are use=
d in the Romulus. Could anyone explain what  avsbus-control and vrm-control=
 i2c command sequences do or give register description for the IR35221, ple=
ase?
>
>
>   Regards,
>
>   Alexander Soldatov.
