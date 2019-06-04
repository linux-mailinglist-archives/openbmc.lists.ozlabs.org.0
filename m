Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC9933D57
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 04:59:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HxTQ0HqrzDqN5
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 12:59:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d41; helo=mail-io1-xd41.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DYK2cW1t"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HxSt2MtczDq9S
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jun 2019 12:58:38 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id e5so16150781iok.4
 for <openbmc@lists.ozlabs.org>; Mon, 03 Jun 2019 19:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sjn5mwqaDTyrn7e6lQ9a7+Z4/hWJHy8YW/NCuce8S6A=;
 b=DYK2cW1tzHpF13JkxqFlDOaTbkKws9c7kENta2h1Ov9e9h+R1Z+2Iih9vxhd5GkRpA
 X2MarWhWV4aPxzhecwS5kopjIIsisIPHeGqVsIv2M0HCEXYYOd6o0Ny2O0jRF6QrHzMf
 1Kp4cCI4yVdwmnOsAk6oAYNb5kxrB+I6yfOpAisX3ATuk3uaEu9uhrIBxh5fp62Y8Ywy
 v+7D2UkMEWMar7EB31az6fAhDgcRFZyKCBYuJ6qett1z8GB1LQciQ/tAOxbw5vKlhy03
 EXXtFeUyCHduZ44QiYA9Py4WLadwrPqT/TwPr7joNR9Hvs9wsIsD+9PdGeqiDDRGPCgg
 YGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sjn5mwqaDTyrn7e6lQ9a7+Z4/hWJHy8YW/NCuce8S6A=;
 b=sHfD9/YOEEXDchEsMIi7bzWxQWq/gN7iXIgRsmr9PxxiuW8xobClH29rAm2fOtGa26
 XWWRxoUIywypA67Km7klfB7TLFhCkoEAN0CFonfQJXdjmxDd7jBocmT/nhj1Z3obY1Ze
 u42jFrxswRU/t05kslKQuCB5DoJrH0+yIPiVier1uIG6v5yEG8Qg4bMfhgzsLa0lPxdK
 r03UeLRrltj/jTq2Zm1Fbgb9G2ABjQEOVUBWZr8R0NpTI2hq2G1+3awOYuUM0lwiqcwS
 kPUMMdqP7jefaJpQ2mHwb3dZYDSWeeyV8m25GZ2BU64U8W8hao/KRvk+EXZo1TthuSm9
 ZPRA==
X-Gm-Message-State: APjAAAVEw1fwvGYG0Jn0Yy7QThVCwCJ22SUhLIW0xE9BRQTOdyqsCCkn
 zMFjtl3/oH8N5TswjtIozqklD9Bcorva2FBnVjY=
X-Google-Smtp-Source: APXvYqzlQq9D0bA8Jd7dBXi2BIipQv7C5l0Cf0oNg14rLPFwMTg7gZRUhroaCOugIOr0DKf6cKYT4435UfzI6uHrdjg=
X-Received: by 2002:a6b:4101:: with SMTP id n1mr19208273ioa.138.1559617114392; 
 Mon, 03 Jun 2019 19:58:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAARXrt=6mZtVuwdTxamjUWXJk5RXNKaNM9aVZE5nEyTjowVjEQ@mail.gmail.com>
 <CALLMt=pdm=Nk5sCZvZBORb+N5suT7-FK0xbvWUy3Qxg5KcttKA@mail.gmail.com>
 <BL0PR2101MB09320BD7856E280C04852CB1C8140@BL0PR2101MB0932.namprd21.prod.outlook.com>
In-Reply-To: <BL0PR2101MB09320BD7856E280C04852CB1C8140@BL0PR2101MB0932.namprd21.prod.outlook.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 4 Jun 2019 10:58:23 +0800
Message-ID: <CAARXrtnJ1SsSVb2Y=5tvVVQtOouUpmZR4XoY4p=vhgizHmh4hA@mail.gmail.com>
Subject: Re: [Design] PSU firmware update
To: Neeraj Ladkani <neladk@microsoft.com>
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

On Tue, Jun 4, 2019 at 1:23 AM Neeraj Ladkani <neladk@microsoft.com> wrote:
>
> 1. Why host power off is a pre-condition? We should add this a PSU pre-requisite to support Live upgrade and activation.

Derek's reply explains the reason why we want to the host power off as
pre-condition.

> 2. How should PSU update impact PSU and battery monitoring ? should there be coordination between sensor monitoring task during update ?

This is a good point. During PSU update, the driver probably should be unbind,
and after the update is one, rebind the driver.
Does that sounds OK?

> 3. PSU may have multiple regions like bootloader, active region and inactive region. We should design to support multiple region update.

I do not have detailed information about this, which is more suitable to let
the vendor-specific tool to handle the multiple regions.
What do you think?

> 4. Can you propose required SEL logs and telemetry requirements as well ?

While I was writing this design doc, I was not thinking about the detailed SEL
logs.
Will need some time to discuss this and see if it shall be covered in this doc
or not.
