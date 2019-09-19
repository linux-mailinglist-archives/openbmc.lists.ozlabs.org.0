Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAB1B7F54
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 18:46:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Z2mJ2nyszF56C
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 02:46:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="e8VUi9FW"; 
 dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Z2lK0NJ0zDqHn
 for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2019 02:45:14 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id b10so1876390plr.4
 for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2019 09:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gxamd5wocXCgQ8EBLRqZe/VJFsa3+nDBdvbDobPpMoE=;
 b=e8VUi9FWt6ekipkKpE8XxTP2zu0oEdmv8q0U823um6ywSw2vwYrvj5115dCW4Dm+Ef
 vSKCZ6p8L8NU7xbp5rgOWS/qnSLhru8TSepPoGNElU1BtZidLDbBbrTfE1WFKcXqYutM
 fa0PRh0ac2JxV9zZF1eWXnHwqtscmX2OWWvHjVSdnyc4N/XKLk375NyYfchR6/wOqJWj
 bLfZg5vLUcoFP6teyyIljPk6jKGN8SGA5Hg//kCJhhhcz3SnMTQfu9Om5v1OeQJs4U2+
 8BdQCvfP8csDRF2s8zd+0NwcvQEWmSiTJYaMyAKV4r/bW5d5EA2cdH2m7QaK7o1jahDi
 718g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gxamd5wocXCgQ8EBLRqZe/VJFsa3+nDBdvbDobPpMoE=;
 b=qVRQzu70VTj69VRUIq7WO1Au0kfTkhpUCd2jlaxXn9LKSrvzizXMSaHo5dI/Ki84DS
 iQVTTFUHK2bCSaRbRDGICDbqfD+aEqZqfA1KLkuvPYese/1RELjdUWIHeZUwYBnRAghX
 9Eg1qJb5/vCu49ozdFXWpbyxtp5NltfQ/Ge26Ozj3125FRJDQBMvIYC9e5rPSyIX/LV6
 JpcelAIhD9MuPW+XELqnJZBJSQcyvB3JX5nBvGguwX977laD+K75Yy37g6julK6cTrih
 7QIX94+a9v8n7xkjF5DV7ICtCU02y3TbQh9V2oYOSqNRLf5OsmMh4KrkRdWUYXnQiIMX
 MPwQ==
X-Gm-Message-State: APjAAAV3mjngUG8oc7Abr90f/7Au9HnpfQi1fvK+6j4MKNYwISNfRoXg
 Li9EX20Wsi3gbi/M4YwBmzYjG4cVyq54uj9Q4AkcmA==
X-Google-Smtp-Source: APXvYqwbdQRWIKPMesRcnsS18LJXZBLWYPEAxz6Nwo+Tf4UnL6/mYhv7BvNzxg/MNHXsXcTL4USpLuQxTW7mtnftnsA=
X-Received: by 2002:a17:902:760a:: with SMTP id
 k10mr10590601pll.183.1568911508637; 
 Thu, 19 Sep 2019 09:45:08 -0700 (PDT)
MIME-Version: 1.0
References: <637583D1-F0AD-4853-A0E1-860FAC93AC22@fuzziesquirrel.com>
In-Reply-To: <637583D1-F0AD-4853-A0E1-860FAC93AC22@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 19 Sep 2019 09:44:57 -0700
Message-ID: <CAO=notz96LSg6YXXz_m-UPZbjHGsdTN2qeDWjj7ujOXZcZ1TsQ@mail.gmail.com>
Subject: Re: add zeus to layer compatibility
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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

On Thu, Sep 19, 2019 at 9:42 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> This is just a quick reminder to add zeus to your LAYERSERIES_COMPAT.
> Doing this ahead of time (now) will save you from a last minute scramble
> when I pull in OE-Core that drops support for warrior.

Thanks for the advanced warning!  Will push patches for quanta,
ingrasys and google.

>
> thx - brad
