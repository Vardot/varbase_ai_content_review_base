<?php

/**
 * @file
 * The blog post the access and accessibility suites review.
 *
 * Run with "drush php:script" after the recipe and the users exist. Saves a
 * published blog post as the content editor and aliases its AI Review page to
 * /ai-review-test, so the suites never depend on a node ID: a site template
 * ships content of its own, which takes the first IDs.
 *
 * Published, so a refused user gets the AI Review tab's own 403. On a draft,
 * Varbase Content Base's "Unpublished 404" ECA model answers 404 first.
 */

use Drupal\node\Entity\Node;
use Drupal\path_alias\Entity\PathAlias;
use Drupal\user\Entity\User;

$editors = \Drupal::entityTypeManager()->getStorage('user')->loadByProperties(['name' => 'content_editor']);
$editor = reset($editors);
if (!$editor instanceof User) {
  throw new \RuntimeException('The content_editor user does not exist.');
}

$node = Node::create([
  'type' => 'blog',
  'title' => 'A post for the access checks',
  'uid' => $editor->id(),
  'status' => 1,
]);
if ($node->hasField('moderation_state')) {
  $node->set('moderation_state', 'published');
}
$node->save();

PathAlias::create([
  'path' => '/node/' . $node->id() . '/ai-review',
  'alias' => '/ai-review-test',
  'langcode' => $node->language()->getId(),
])->save();

echo 'AI Review test post: node ' . $node->id() . ' at /ai-review-test' . PHP_EOL;
