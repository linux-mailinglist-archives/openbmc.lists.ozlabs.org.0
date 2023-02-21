Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6835F69E9B9
	for <lists+openbmc@lfdr.de>; Tue, 21 Feb 2023 22:48:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLtFY29gzz3c65
	for <lists+openbmc@lfdr.de>; Wed, 22 Feb 2023 08:48:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=M+z+WwF0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=M+z+WwF0;
	dkim-atps=neutral
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLtDs1R7bz306Y
	for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2023 08:47:39 +1100 (AEDT)
Received: by mail-ed1-x534.google.com with SMTP id o12so23268780edb.9
        for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2023 13:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c8KgjLYKuqHlH+HQAVUIS4e3vMIj+ypnYOymJ9omQJ0=;
        b=M+z+WwF0OUz9zWkntWkPG2hc3tH9Diwu++oKWT84sjgcTfOUzYI7T+M6TrH8fUWmLw
         yJNq9fC1mtJUt2MnHKvLD4/oWH32M9L9cX9ITjIR5/GX5t275xZQmypdVboUX2RhSIyU
         8mzYsLxa8BuufNpYKgQS/Ea07nPWwKLNY6YQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c8KgjLYKuqHlH+HQAVUIS4e3vMIj+ypnYOymJ9omQJ0=;
        b=WdA3Bsx2JE74YojqE9uWjL2I7UmaIXKXxRcWBJ0gVSqPVRDZJtXgeURjDc6sWbElxX
         38FSKh+8s24/AfGNIEuJndgbXOrfylY6Pf+7CbuVxuozQ238fHXBPATSZAEVHNqJd0rB
         5ZXi5iTShOwxcuoWIVN8PexpJ4rag5CsKx6nL8EHi6SJ5Hs4D4vo39NxJ50eecpJO7Ga
         yO649bzQlhJmOFUZGZJkAxh0WBin5KjPO5G9BMp8LCOrOmGgiCQAQ5eXlLOQtZDl9z0b
         4xPfhmYXetaFZ10Xg1DYOZwFoc3ChURoA55rk+EAN9jaP7a577stXDX1x0kuj8At2vJd
         hRvg==
X-Gm-Message-State: AO0yUKVV5m+omYeJod1u9x8sESKPDvOU+zbxZrXrk4xSK2YXKabUITQI
	Na3OhyXUPO/2lNkV+FgboJl5jBTcTPo8hMBIdVz9EPd37Xk=
X-Google-Smtp-Source: AK7set/jJPRNEc7l7Qcg0CAge5HNQwAiFII4yMZOIOqj5MwBEhurxe1Y6kKak+AJhA/z5H68HTZL65RX8Yc7BFvRmak=
X-Received: by 2002:a17:906:79b:b0:87b:db55:4887 with SMTP id
 l27-20020a170906079b00b0087bdb554887mr6350525ejc.4.1677016051016; Tue, 21 Feb
 2023 13:47:31 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 21 Feb 2023 21:47:18 +0000
Message-ID: <CACPK8XfAtPfUxBP92iwqRpnaRgP=51_SyuYsxCrpk3MQ9do6WA@mail.gmail.com>
Subject: OpenBMC Linux 6.1
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I'm moving the kernel tree openbmc uses to a 6.1 base for ASPEED. This
release is
supported upstream until the end of 2026, which is useful for anyone
looking to stay on the same kernel version for a long time.

+1 party is here:

 https://gerrit.openbmc.org/c/openbmc/openbmc/+/61083

I've tested this on IBM's ast2600 based Rainier and Everest platforms
("p10bmc"), but further testing would be welcome.

There are 91 patches in the tree, with 38 of those patches not yet
queued for merging in v6.3. Most of the patches we carry have been
around for many years, and are changes that no one is working on.

If you have bandwidth to work on the maxim fan controller, or the
devmem kernel command line patch, or upstreaming the xdma driver, work
in these areas would be welcomed.

Cheers,

Joel
